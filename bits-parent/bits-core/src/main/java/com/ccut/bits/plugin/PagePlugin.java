/*
* PagePlugin.java
* Created on  202015/2/7 14:01
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/7     panzhuowen    初始版本
*
*/

package com.ccut.bits.plugin;

import com.ccut.bits.model.User;
import com.ccut.bits.page.Page;
import com.ccut.bits.page.PageBase;
import com.ccut.bits.util.ReflectUtil;
import com.ccut.bits.util.StringUtil;
import org.apache.ibatis.executor.ErrorContext;
import org.apache.ibatis.executor.ExecutorException;
import org.apache.ibatis.executor.statement.BaseStatementHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.mapping.ParameterMode;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.property.PropertyTokenizer;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.type.TypeHandler;
import org.apache.ibatis.type.TypeHandlerRegistry;

import javax.servlet.http.HttpSession;
import javax.xml.bind.PropertyException;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

/**
 * 类的描述信息
 * 分页拦截器
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class})})
public class PagePlugin implements Interceptor {

    private static String dialect = "";
    private static String pageSqlId = "";

    public PagePlugin() {
    }

    public Object intercept(Invocation ivk) throws Throwable {
        if (ivk.getTarget() instanceof RoutingStatementHandler) {
            RoutingStatementHandler statementHandler = (RoutingStatementHandler) ivk.getTarget();
            BaseStatementHandler delegate = (BaseStatementHandler) ReflectUtil.getValueByFieldName(statementHandler, "delegate");
            MappedStatement mappedStatement = (MappedStatement) ReflectUtil.getValueByFieldName(delegate, "mappedStatement");
            if (mappedStatement.getId().matches(pageSqlId)) {
                BoundSql boundSql = delegate.getBoundSql();
                Object parameterObject = boundSql.getParameterObject();
                if (parameterObject == null) {
                    throw new NullPointerException("parameterObject尚未实例化！");
                }

                Connection connection = (Connection) ivk.getArgs()[0];
                Page page = this.getPage(parameterObject);
                page.setTotalResult(this.getTotalResult(statementHandler, connection,page));
                if (page.hasSumColumns() && page.lessThanMaxSumLimit()) {
                    page.setSumResult(this.getSumResult(statementHandler, connection, page));
                }

                String pageSql = this.generatePageSql(boundSql.getSql(), page);
                ReflectUtil.setValueByFieldName(boundSql, "sql", pageSql);
            }
        }

        return ivk.proceed();
    }

    private Page getPage(Object parameterObject) throws NoSuchFieldException {
        Page page;
        if (parameterObject instanceof Page) {
            page = (Page) parameterObject;
        } else if (parameterObject instanceof Map) {
            Map pageField = (Map) parameterObject;
            page = (Page) pageField.get("page");
            if (page == null) {
                page = new Page();
            }
        } else {
            Field pageField1 = ReflectUtil.getFieldByFieldName(parameterObject, "page");
            if (pageField1 == null) {
                throw new NoSuchFieldException(parameterObject.getClass().getName() + "不存在 page 属性！");
            }

            page = ((PageBase) parameterObject).getPage();
            if (page == null) {
                page = new Page();
            }
        }

        return page;
    }

    private int getTotalResult(RoutingStatementHandler statementHandler, Connection connection,Page page) {
        int totalResult = 0;
        try {
            BaseStatementHandler e = (BaseStatementHandler) ReflectUtil.getValueByFieldName(statementHandler, "delegate");
            MappedStatement mappedStatement = (MappedStatement) ReflectUtil.getValueByFieldName(e, "mappedStatement");
            BoundSql boundSql = e.getBoundSql();
            Object parameterObject = boundSql.getParameterObject();
            String sql = boundSql.getSql();
            String countSql = "select count(0) from (" + sql + ") as tmp_count";
            if(page.getId()!=0) {
                 countSql = "select count(0) from (" + sql + " where user_id=" + page.getId() + ") as tmp_count";
            }
            PreparedStatement countStmt = connection.prepareStatement(countSql);
            BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(), countSql, boundSql.getParameterMappings(), parameterObject);
            this.setParameters(countStmt, mappedStatement, countBS, parameterObject);
            ResultSet rs = countStmt.executeQuery();
            if (rs.next()) {
                totalResult = rs.getInt(1);
            }

            rs.close();
            countStmt.close();
        } catch (SQLException var13) {
            var13.printStackTrace();
        }

        return totalResult;
    }

    private Map<String, String> getSumResult(RoutingStatementHandler statementHandler, Connection connection, Page page) throws SQLException {
        HashMap sumResultMap = new HashMap();

        try {
            BaseStatementHandler e = (BaseStatementHandler) ReflectUtil.getValueByFieldName(statementHandler, "delegate");
            MappedStatement mappedStatement = (MappedStatement) ReflectUtil.getValueByFieldName(e, "mappedStatement");
            BoundSql boundSql = e.getBoundSql();
            Object parameterObject = boundSql.getParameterObject();
            String sql = boundSql.getSql();
            String sumSql = this.getSumSql(sql, page);
            PreparedStatement sumStatement = connection.prepareStatement(sumSql);
            BoundSql sumBoundSql = new BoundSql(mappedStatement.getConfiguration(), sumSql, boundSql.getParameterMappings(), parameterObject);
            this.setParameters(sumStatement, mappedStatement, sumBoundSql, parameterObject);
            ResultSet rs = sumStatement.executeQuery();
            if (rs.next()) {
                String[] arr$ = page.getSumColumns();
                int len$ = arr$.length;

                for (int i$ = 0; i$ < len$; ++i$) {
                    String sumColumn = arr$[i$];
                    sumResultMap.put(sumColumn, rs.getString(sumColumn));
                }
            }

            rs.close();
            sumStatement.close();
            page.setSumResult(sumResultMap);
        } catch (SQLException var18) {
            var18.printStackTrace();
        }

        return sumResultMap;
    }

    private String getSumSql(String sql, Page page) {
        String sumSql = "SELECT ";
        String[] arr$ = page.getSumColumns();
        int len$ = arr$.length;

        for (int i$ = 0; i$ < len$; ++i$) {
            String column = arr$[i$];
            sumSql = sumSql + " IFNULL(SUM(" + column + "),0) AS " + column + ",";
        }

        sql = sumSql.substring(0, sumSql.length() - 1) + " FROM (" + sql + ") a";
        return sql;
    }

    private void setParameters(PreparedStatement ps, MappedStatement mappedStatement, BoundSql boundSql, Object parameterObject) throws SQLException {
        ErrorContext.instance().activity("setting parameters").object(mappedStatement.getParameterMap().getId());
        List parameterMappings = boundSql.getParameterMappings();
        if (parameterMappings != null) {
            Configuration configuration = mappedStatement.getConfiguration();
            TypeHandlerRegistry typeHandlerRegistry = configuration.getTypeHandlerRegistry();
            MetaObject metaObject = parameterObject == null ? null : configuration.newMetaObject(parameterObject);

            for (int i = 0; i < parameterMappings.size(); ++i) {
                ParameterMapping parameterMapping = (ParameterMapping) parameterMappings.get(i);
                if (parameterMapping.getMode() != ParameterMode.OUT) {
                    String propertyName = parameterMapping.getProperty();
                    PropertyTokenizer prop = new PropertyTokenizer(propertyName);
                    Object value;
                    if (parameterObject == null) {
                        value = null;
                    } else if (typeHandlerRegistry.hasTypeHandler(parameterObject.getClass())) {
                        value = parameterObject;
                    } else if (boundSql.hasAdditionalParameter(propertyName)) {
                        value = boundSql.getAdditionalParameter(propertyName);
                    } else if (propertyName.startsWith("__frch_") && boundSql.hasAdditionalParameter(prop.getName())) {
                        value = boundSql.getAdditionalParameter(prop.getName());
                        if (value != null) {
                            value = configuration.newMetaObject(value).getValue(propertyName.substring(prop.getName().length()));
                        }
                    } else {
                        value = metaObject == null ? null : metaObject.getValue(propertyName);
                    }

                    TypeHandler typeHandler = parameterMapping.getTypeHandler();
                    if (typeHandler == null) {
                        throw new ExecutorException("There was no TypeHandler found for parameter " + propertyName + " of statement " + mappedStatement.getId());
                    }

                    typeHandler.setParameter(ps, i + 1, value, parameterMapping.getJdbcType());
                }
            }
        }

    }

    private String generatePageSql(String sql, Page page) {
        if (page != null && StringUtil.notEmpty(dialect)) {
            StringBuffer pageSql = new StringBuffer();
            if ("mysql".equals(dialect)) {
                pageSql.append(sql);
                if(page.getId()!=0) {
                    pageSql.append(" where user_id=" + page.getId() + " ORDER BY file_time DESC limit " + page.getCurrentResult() + "," + page.getPageSize());
                }else{
                    pageSql.append(" limit " + page.getCurrentResult() + "," + page.getPageSize());//管理员要所有的文件所以不管用户id
                }
            } else if ("oracle".equals(dialect)) {
                pageSql.append("select * from (select tmp_tb.*,ROWNUM row_id from (");
                pageSql.append(sql);
                pageSql.append(") as tmp_tb where ROWNUM<=");
                pageSql.append(page.getCurrentResult() + page.getPageSize());
                pageSql.append(") where row_id>");
                pageSql.append(page.getCurrentResult());
            }

            return pageSql.toString();
        } else {
            return sql;
        }
    }

    public Object plugin(Object arg0) {
        return Plugin.wrap(arg0, this);
    }

    public void setProperties(Properties p) {
        dialect = p.getProperty("dialect");
        if (StringUtil.isEmpty(dialect)) {
            try {
                throw new PropertyException("dialect property is not found!");
            } catch (PropertyException var4) {
                var4.printStackTrace();
            }
        }

        pageSqlId = p.getProperty("pageSqlId");
        if (StringUtil.isEmpty(pageSqlId)) {
            try {
                throw new PropertyException("pageSqlId property is not found!");
            } catch (PropertyException var3) {
                var3.printStackTrace();
            }
        }

    }
}
