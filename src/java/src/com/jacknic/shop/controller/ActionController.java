package com.jacknic.shop.controller;

import com.jacknic.shop.Entity.UserEntity;
import com.jacknic.shop.service.GoodsService;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

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
    public String buy(@PathVariable(name = "gid") Integer gid) {
        return "action/buy";
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
                    if (!item.isFormField()) {
                        HttpSession session = request.getSession();
                        UserEntity userEntity = (UserEntity) session.getAttribute("user");
                        if (null == userEntity) return "";
                        String pathDir = "/upload/" + userEntity.getId() + "/img/";
                        String realPath = session.getServletContext().getRealPath(pathDir);
                        File parent = new File(realPath);
                        if (!parent.exists()) {
                            if (!parent.mkdirs()) {
                                System.out.println("创建文件夹失败！");
                            }
                        }

                        int index = item.getName().lastIndexOf('.');
                        StringBuilder extName = new StringBuilder("");
                        if (index != -1) {
                            extName.append(item.getName().substring(index));
                        }
                        String fileName = System.nanoTime() + extName.toString();
                        File save = new File(parent, fileName);
                        FileOutputStream fileOutputStream = new FileOutputStream(save);
                        FileCopyUtils.copy(item.openStream(), fileOutputStream);
                        String callback = request.getParameter("CKEditorFuncNum");
                        return "<script type=\"text/javascript\">" +
                                "window.parent.CKEDITOR.tools.callFunction(" +
                                callback + ",'" + pathDir + fileName + "','')"
                                + "</script>";
                    }
                }
            } catch (FileUploadException e) {
                return "<script type=\"text/javascript\">;alert(\"上传文件过大\");</script>";
            } catch (IOException e) {
                return "<script type=\"text/javascript\">;alert(\"上传文件读取出现问题\");</script>";
            }
        }

        return "<script type=\"text/javascript\">;alert(\"非法图片\");</script>";

    }
}
