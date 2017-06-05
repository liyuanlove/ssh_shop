package com.jacknic.shop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.File;

/**
 * 后台管理默认控制器
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @RequestMapping("/")
    public String index(ModelMap modelMap) {
        File file = new File(".");
        modelMap.addAttribute("html_title", "后台管理系统");
        modelMap.addAttribute("totalSpace", file.getTotalSpace());
        modelMap.addAttribute("freeSpace", file.getFreeSpace());
        return "admin/index";
    }

    /**
     * 控制面板
     */
    @RequestMapping("/dashboard")
    public String dashboard() {
        return "admin/dashboard";
    }


}
