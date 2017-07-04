package com.jacknic.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 默认控制器
 */
@Controller
public class IndexController {
    /**
     * 默认首页
     */
    @RequestMapping(value = "/")
    public String index(ModelMap modelMap) {
        modelMap.addAttribute("html_title", "网站首页");
        return "index/index";
    }

    /**
     * 关于页
     */
    @RequestMapping(value = "/about")
    public String about(ModelMap modelMap) {
        modelMap.addAttribute("html_title", "关于我们");
        return "index/about";

    }

    @RequestMapping("/discount")
    public String discount(ModelMap modelMap) {
        modelMap.addAttribute("html_title", "限时抢购");
        return "index/discount";
    }

    @RequestMapping("/hot")
    public String hot(ModelMap modelMap) {
        modelMap.addAttribute("html_title", "热门推荐");
        return "index/hot";
    }

}
