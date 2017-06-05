package com.jacknic.shop.controller;

import org.springframework.stereotype.Controller;
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
    public String index() {
        return "index/index";
    }

    /**
     * 关于页
     */
    @RequestMapping(value = "/about")
    public String about() {
        return "index/about";
    }

}
