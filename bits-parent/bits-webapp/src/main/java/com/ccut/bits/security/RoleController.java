/*
* RoleController.java
* Created on  202015/2/17 12:29
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/17     panzhuowen    初始版本
*
*/

package com.ccut.bits.security;

import com.ccut.bits.model.MenuPerm;
import com.ccut.bits.model.Permission;
import com.ccut.bits.model.Role;
import com.ccut.bits.page.PageResponse;
import com.ccut.bits.security.service.PermissionService;
import com.ccut.bits.security.service.RolePermissionService;
import com.ccut.bits.security.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Controller
@RequestMapping("/admin/role/")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RolePermissionService rolePermissionService;

    @RequestMapping(value = "getRoleListPageDo", method = {RequestMethod.GET})
    public String getRoleListPageDo() {
        return "security/role/roleListPage";
    }

    @RequestMapping(value = "getRoleListPage", method = {RequestMethod.POST})
    @ResponseBody
    public PageResponse<Role> getRoleListPage(Role role) {
        return new PageResponse<>(role.getPage(),roleService.getRoleListPage(role));
    }

    @RequestMapping(value = "addRoleDo", method = {RequestMethod.GET})
    public String addRoleDo(HttpServletRequest request) {
        List<MenuPerm> menuPermList = permissionService.getMenuTree();
        request.setAttribute("menuPermList",menuPermList);
        return "security/role/addRoleDo";
    }

    @RequestMapping(value = "addRole", method = {RequestMethod.POST})
    @ResponseBody
    public void addRole(Role role) {
        roleService.addRole(role);
        rolePermissionService.addRolePermission(role.getId(),role.getPermToken());
    }

    @RequestMapping(value = "delRole", method = {RequestMethod.DELETE})
    @ResponseBody
    public void delRole(@RequestParam("id") int id) {
        roleService.delRole(id);
        rolePermissionService.delRolePermission(id);
    }

    @RequestMapping(value = "editRoleDo",method = {RequestMethod.GET})
    public String editRoleDo(@RequestParam("id") int id,HttpServletRequest request) {
        Role role = roleService.findRoleById(id);
        List<MenuPerm> menuPermList = permissionService.getMenuTree();
        List<Permission> choosedPerms = rolePermissionService.findChoosedPermissionTokenByRoleId(id);
        String permissionValues = roleService.getPermissionTokenValues(choosedPerms);
        String permissionTokens = roleService.getPermissionTokens(choosedPerms);
        roleService.setHasChecked(menuPermList,choosedPerms);
        request.setAttribute("role",role);
        request.setAttribute("permissionTokens",permissionTokens);
        request.setAttribute("menuPermList",menuPermList);
        request.setAttribute("permissionValues",permissionValues);
        request.setAttribute("choosedPerms",choosedPerms);
        return "security/role/editRoleDo";
    }

    @RequestMapping(value = "editRole", method = {RequestMethod.POST})
    @ResponseBody
    public void editRole(Role role) {
        roleService.editRole(role);
        rolePermissionService.delRolePermission(role.getId());
        rolePermissionService.addRolePermission(role.getId(),role.getPermToken());
    }

    @RequestMapping(value = "validateRoleName",method = {RequestMethod.POST})
    @ResponseBody
    public boolean validateRoleName(Role role) {
        int hasRepeatName = roleService.checkRepeatRoleNameNum(role.getRoleName());
        if (role.getId() == 0 ) { //新增
            if (hasRepeatName >= 1) {
                return false;
            }
        } else { //编辑
            int checkRoleNameByRole = roleService.checkRepeatRoleNameByRole(role);
            if (hasRepeatName > 1) {             //多个角色一个名
                return false;
            }
            if (hasRepeatName == 1 && checkRoleNameByRole == 0) {       // 角色名称只有一个，但不是要修改的这个角色名称
                return false;
            }
        }
        return true;
    }

}
