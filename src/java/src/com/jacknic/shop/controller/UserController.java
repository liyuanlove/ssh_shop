package com.jacknic.shop.controller;

import com.jacknic.shop.entity.UserEntity;
import com.jacknic.shop.service.GoodsService;
import com.jacknic.shop.service.UserService;
import com.jacknic.shop.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户模块
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private GoodsService goodsService;
    private UserService userService;

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 用户个人中心
     */
    @RequestMapping("/center")
    public String center(ModelMap modelMap) {
        modelMap.addAttribute("html_title", "用户中心");
        return "user/profile";
    }

    /**
     * 个人信息页
     **/
    @RequestMapping("/profile")
    public String profile(ModelMap modelMap) {
        modelMap.addAttribute("html_title", "个人信息");
        return "user/profile";
    }

    /**
     * 编辑个人信息页
     **/
    @GetMapping("/profile_edit")
    public String profileEdit(HttpServletRequest request, ModelMap modelMap) {
        modelMap.addAttribute("html_title", "更新个人信息");
        UserEntity user = Utils.getCurrentUser(request);
        modelMap.addAttribute("user", user);
        return "user/profileEdit";
    }

    /**
     * 更新个人信息页
     **/
    @PostMapping("/profile_edit")
    public String doProfileEdit(HttpServletRequest request, ModelMap modelMap) {
        modelMap.addAttribute("html_title", "更新个人信息");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String sex = request.getParameter("sex");
        UserEntity user = Utils.getCurrentUser(request);
        user.setEmail(email);
        user.setPhone(phone);
        user.setSex(Integer.valueOf(sex));
        userService.update(user);
        modelMap.addAttribute("user", user);
        return "user/profileEdit";
    }

    /**
     * 用户收藏页
     **/
    @RequestMapping("/like")
    public String like() {
        return "action/like";
    }

}
