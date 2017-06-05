package com.jacknic.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 帮助模块
 */
@Controller
@RequestMapping("/help")
public class HelpController {
    /**
     * 关于我们页
     */
    @RequestMapping("/about")
    @ResponseBody()
    public String about() {
        return "about";
    }

    /**
     * 联系我们页
     */
    @RequestMapping("/contact")
    @ResponseBody()
    public String contact() {
        return "contact";
    }

    /**
     * 培训页
     */
    @RequestMapping("/train")
    @ResponseBody()
    public String train() {
        return "train";
    }
}
