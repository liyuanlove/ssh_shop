package com.jacknic.shop.controller;

import com.jacknic.shop.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 用户模块
 */
@Controller
@RequestMapping("/user")
public class UserController {
    private GoodsService goodsService;

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    /**
     * 用户个人主页
     */
    @RequestMapping(value = {"/home", "/"})
    public String home() {
        return "user/home";
    }

    /**
     * 用户个人中心
     */
    @RequestMapping("/center")
    public String center() {
        return "user/center";
    }

    /**
     * 个人信息页
     **/
    @RequestMapping("/profile")
    public String profile() {
        return "user/profile";
    }

    /**
     * 用户收藏页
     **/
    @RequestMapping("/like")
    public String like() {
        return "user/like";
    }

    /**
     * 用户物流信息页
     **/
    @RequestMapping("/logistics")
    public String logistics() {
        return "user/logistics";
    }

    /**
     * 用户购物记录页
     **/
    @RequestMapping("/record")
    public String record() {
        return "user/record";
    }

}
