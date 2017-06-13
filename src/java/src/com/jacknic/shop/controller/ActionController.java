package com.jacknic.shop.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jacknic.shop.entity.GoodsEntity;
import com.jacknic.shop.entity.UserEntity;
import com.jacknic.shop.service.GoodsService;
import com.jacknic.shop.utils.JSONMessage;
import com.jacknic.shop.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 操作动作模块
 */
@Controller
@RequestMapping("/action")
public class ActionController {


    private GoodsService goodsService;

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    /**
     * 购买单个商品
     */
    @RequestMapping("/buy/{gid}")
    public String buy(@PathVariable(name = "gid") Integer gid, ModelMap modelMap) {
        GoodsEntity goodsById = goodsService.getGoodsById(gid);
        if (goodsById == null) {
            modelMap.addAttribute("html_title", "该商品信息不存在");
            modelMap.addAttribute("error_title", "可惜，该商品信息不存在");
            modelMap.addAttribute("error_msg", "");
            return "error_default";
        }
        modelMap.addAttribute("goods", goodsById);
        return "action/buy";
    }

    /**
     * 购买多个商品
     */
    @ResponseBody
    @RequestMapping("/buy/all")
    public String buyAll(@RequestParam(name = "order_data", defaultValue = "") String order_data, ModelMap modelMap) {
        System.out.println("原始的字符值是：" + order_data);
        if (!StringUtils.isEmpty(order_data)) {
            try {
                JSONObject json_data = JSONObject.parseObject(order_data);
                System.out.println(order_data);
                JSONArray gids = json_data.getJSONArray("gids");
                JSONArray nums = json_data.getJSONArray("nums");
                System.out.println(gids);
                System.out.println(nums);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return order_data;
    }


    /**
     * 支付页
     */
    @RequestMapping("/payment")
    public String payment() {
        return "action/payment";
    }

    /**
     * 处理上传文件
     */
    @ResponseBody
    @PostMapping(value = "/upload")
    public String upload(HttpServletRequest request) {
        UserEntity userEntity = Utils.getCurrentUser(request);
        if (null == userEntity) return "";
        String pathDir = "/upload/" + userEntity.getId() + "/file/";
        String uploadPath = Utils.doUpload(request, pathDir);
        JSONMessage jsonMessage = new JSONMessage();
        if (uploadPath == null) {
            jsonMessage.setSuccess(false);
            jsonMessage.setData("上传文件失败！");
        } else {
            jsonMessage.setData(uploadPath);
        }
        return jsonMessage.toString();

    }

    /**
     * 处理上传图片
     */
    @ResponseBody
    @PostMapping(value = "/upload/image")
    public String uploadImage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        UserEntity userEntity = (UserEntity) session.getAttribute("user");
        if (null == userEntity) return "";
        String pathDir = "/upload/" + userEntity.getId() + "/img/";
        String fileUploadPath = Utils.doUpload(request, pathDir);
        String callback = request.getParameter("CKEditorFuncNum");
        if (fileUploadPath != null && !StringUtils.isEmpty(callback)) {
            //回调编辑器
            return "<script type=\"text/javascript\">" +
                    "window.parent.CKEDITOR.tools.callFunction(" +
                    callback + ",'" + fileUploadPath + "','')"
                    + "</script>";
        }
        return "<script type=\"text/javascript\">;alert(\"非法图片\");</script>";

    }

}
