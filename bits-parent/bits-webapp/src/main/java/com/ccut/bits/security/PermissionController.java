/*
* PermissionController.java
* Created on  202015/2/7 17:56
* 版本       修改时间         作者        修改内容
* V1.0.1     2015/2/7     panzhuowen    初始版本
*
*/

package com.ccut.bits.security;

import com.ccut.bits.model.Permission;
import com.ccut.bits.security.service.PermissionService;
import com.ccut.bits.page.PageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 类的描述信息
 *
 * @author panzhuowen
 * @version 1.0.1
 */
@Controller
@RequestMapping("/admin/permission/")
public class PermissionController {

    @Autowired
    private PermissionService permissionService;

    @RequestMapping(value = "getPermissionListPageDo", method = {RequestMethod.GET})
    public String getPermissionListPageDo() {
        return "security/permission/permissionListPageDo";
    }

    @RequestMapping(value = "getPermissionListPage", method = {RequestMethod.POST})
    @ResponseBody
    public PageResponse<Permission> getPermissionListPage(Permission permission) {
        return new PageResponse<>(permission.getPage(),permissionService.getPermissionListPage(permission));
    }

    @RequestMapping(value = "delPermission", method = {RequestMethod.DELETE})
    @ResponseBody
    public void delPermission(@RequestParam("id") int id){
        permissionService.delPermission(id);
    }

    @RequestMapping(value = "addPermissionDo",method = {RequestMethod.GET})
    public String addPermissionDo() {
        return "security/permission/addPermissionDo";
    }

    @RequestMapping(value = "addPermission", method = {RequestMethod.POST})
    @ResponseBody
    public void addPermission(Permission permission) {
        permissionService.addPermission(permission);
    }

    @RequestMapping(value = "editPermissionDo", method = {RequestMethod.GET})
    public String editPermissionDo(@RequestParam("id") int id,HttpServletRequest request) {
        Permission permission = permissionService.findPermissionById(id);
        request.setAttribute("permission",permission);
        return "security/permission/editPermissionDo";
    }

    @RequestMapping(value = "editPermission", method = {RequestMethod.POST})
    @ResponseBody
    public void editPermission(Permission permission) {
        permissionService.editPermission(permission);
    }

    @RequestMapping(value = "checkPermToken", method = {RequestMethod.POST})
    @ResponseBody
    public boolean checkPermToken(Permission permission) {
        int hasRepeatName = permissionService.checkRepeatPermToken(permission);
        if (permission.getId() == 0) { //新增
            if (hasRepeatName >= 1) {
                return false;
            }
        } else {  //编辑
            int checkRepeatRoleName = permissionService.checkRepeatPermissionName(permission);
            if (hasRepeatName > 1) {
                return false;
            }
            if (hasRepeatName == 1 && checkRepeatRoleName == 0) {
                return false;
            }
        }
        return true;
    }

}
