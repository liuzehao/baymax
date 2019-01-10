package com.ccut.bits.file;

/**
 * Created by hao pc on 2016/5/27.
 * 预览的接口，为了中文字符醉了
 */
import java.io.*;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 支持中文URL转换编码使用,此类与filedown的区别在于对文件名的转码 现在没用了
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/FileShow" })
public class FileShow extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileShow() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        //获得请求文件名
        String filename = request.getParameter("filename");
        try {
            filename=new String(filename.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        filename=filename.toLowerCase();

        String mimeType=getServletContext().getMimeType(filename);
        //设置文件MIME类型
        response.setContentType(mimeType);
        //设置Content-Disposition
        response.setHeader("Content-Disposition", "attachment;filename="+ filename);
        //读取目标文件，通过response将目标文件写到客户端
        //获取目标文件的绝对路径
        String fullFileName = getServletContext().getRealPath("/upload/" + filename);
        if(mimeType.equals("application/vnd.openxmlformats-officedocument.wordprocessingml.document")||mimeType.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")||mimeType.equals("application/vnd.openxmlformats-officedocument.presentationml.presentation")||mimeType.equals("application/vnd.ms-powerpoint")||mimeType.equals("application/msword")||mimeType.equals("application/vnd.ms-excel")||mimeType.equals("text/html")||mimeType.equals("text/plain")||mimeType.equals("application/x-rar-compressed")||mimeType.equals("application/zip")||mimeType.equals("application/pdf"))
        {
            fullFileName =getServletContext().getRealPath("/upload/documents/" + filename);
        }
        //System.out.println(fullFileName);
        //读取文件
        InputStream in = new FileInputStream(fullFileName);

        OutputStream out = response.getOutputStream();

        //写文件
        int b;
        while((b=in.read())!= -1)
        {
            out.write(b);
        }

        in.close();
        out.close();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }

}
