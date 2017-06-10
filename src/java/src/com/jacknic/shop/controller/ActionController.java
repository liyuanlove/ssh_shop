package com.jacknic.shop.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jacknic.shop.entity.GoodsEntity;
import com.jacknic.shop.entity.UserEntity;
import com.jacknic.shop.service.GoodsService;
import com.jacknic.shop.utils.Utils;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;

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

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String upload(HttpServletRequest request) {
        //判断是否是文件上传请求
        if (ServletFileUpload.isMultipartContent(request)) {
            // 创建文件上传处理器
            ServletFileUpload upload = new ServletFileUpload();
            //限制单个上传文件的大小
            upload.setFileSizeMax(1L << 24);
            try {
                // 解析请求
                FileItemIterator iter = upload.getItemIterator(request);
                while (iter.hasNext()) {
                    FileItemStream item = iter.next();
                    System.out.println(item.getName());
                    System.out.println(item.getContentType());
                    if (!item.isFormField()) {
                        //是文件上传对象，获取上传文件的输入流
                        InputStream srcinInputStream = item.openStream();
                        /*对上传文件的输入流进行处理，跟本地的文件流处理方式相同*/

                    }
                }
            } catch (FileUploadException e) {
                System.out.println("上传文件过大");
            } catch (IOException e) {
                System.out.println("文件读取出现问题");
            }
        }
        return "success";

    }

    @ResponseBody
    @RequestMapping(value = "/upload/image", method = RequestMethod.POST)
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
