package com.jacknic.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 信息通知模块
 */
@Controller
@RequestMapping("/message")
public class MessageController {
    /**
     * 读取信息
     *
     * @param msg_id 信息ID
     */
    @RequestMapping("/read/{msg_id}")
    @ResponseBody
    public String read(@PathVariable(name = "msg_id") Integer msg_id) {
        if (msg_id != null) {
            return "message " + msg_id + "details";
        }
        return "不存在该内容";
    }

    /**
     * 信息列表
     */
    @RequestMapping(value = {"/list", "/"})
    public String list() {
        return "message/index";
    }
}
