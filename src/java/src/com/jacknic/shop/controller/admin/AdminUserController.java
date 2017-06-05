package com.jacknic.shop.controller.admin;

import com.jacknic.shop.Entity.UserEntity;
import com.jacknic.shop.service.UserService;
import com.jacknic.shop.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * 后台用户管理模块
 */
@Controller
@RequestMapping("/admin/user")
public class AdminUserController {
    private UserService userService;


    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/list")
    public String productList(ModelMap modelMap, @RequestParam(name = "page", defaultValue = "1") int page,
                              @RequestParam(name = "pageSize", defaultValue = "12") int pageSize) {
        modelMap.addAttribute("html_title", "用户列表");
        if (pageSize > 60 || pageSize < 12) {
            pageSize = 12;
        }
        int usersCount = userService.getUsersCount();
        int currentPage = Utils.getPageNum(page, pageSize, usersCount);
        int maxPage = Utils.getMaxPage(pageSize, usersCount);
        List<UserEntity> userEntityList = userService.getUsers(currentPage, pageSize);
        modelMap.addAttribute("usersList", userEntityList);
        modelMap.addAttribute("currentPage", currentPage);
        modelMap.addAttribute("maxPage", maxPage);
        modelMap.addAttribute("usersCount", usersCount);
        return "admin/user/usersList";
    }

    @RequestMapping("/delete/{id}")
    public String delById(@PathVariable(name = "id") int id) {
        int result = userService.delUserById(id);
        return "redirect:/admin/user/list";
    }

    @GetMapping("/add")
    public String add() {
        return "admin/user/add";
    }
}
