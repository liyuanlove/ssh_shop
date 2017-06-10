package com.jacknic.shop.controller.admin;

import com.jacknic.shop.controller.ActionController;
import com.jacknic.shop.entity.GoodsEntity;
import com.jacknic.shop.service.GoodsService;
import com.jacknic.shop.utils.JSONMessage;
import com.jacknic.shop.utils.Utils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

/**
 * 后台商店模块控制器
 */
@Controller
@RequestMapping("/admin/shop")
public class AdminShopController {
    private GoodsService goodsService;

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @RequestMapping("/productsList")
    public String productList(ModelMap modelMap, @RequestParam(name = "page", defaultValue = "1") int page,
                              @RequestParam(name = "pageSize", defaultValue = "12") int pageSize) {
        modelMap.addAttribute("html_title", "商品列表");
        if (pageSize > 60 || pageSize < 12) {
            pageSize = 12;
        }
        int goodsCount = goodsService.getGoodsCount();
        int currentPage = Utils.getPageNum(page, pageSize, goodsCount);
        int maxPage = Utils.getMaxPage(pageSize, goodsCount);
        List<GoodsEntity> goodsEntityList = goodsService.getGoods(currentPage, pageSize);
        modelMap.addAttribute("goodsList", goodsEntityList);
        modelMap.addAttribute("currentPage", currentPage);
        modelMap.addAttribute("maxPage", maxPage);
        modelMap.addAttribute("goodsCount", goodsCount);
        return "admin/shop/productsList";
    }

    @RequestMapping("/delete/{gid}")
    public String delByGid(@PathVariable(name = "gid") int gid) {
        int result = goodsService.delGoodsById(gid);
        return "redirect:/admin/shop/productsList";
    }

    @GetMapping("/add")
    public String add() {
        return "admin/shop/add";
    }

    @PostMapping("/add")
    public String doAdd(GoodsEntity goodsEntity, ModelMap modelMap) {
        goodsEntity.setStatus(0);
        System.out.println(goodsEntity);
        goodsService.save(goodsEntity);
        modelMap.addAttribute("html_title", "上架商品信息");
        modelMap.addAttribute("msg", goodsEntity.getTitle() + "上架成功");
        return "admin/shop/add";
    }

    @ResponseBody
    @PostMapping("/upload/")
    public String upload(HttpServletRequest request) {
        String pathDir = "/upload/goods/img/";
        String uploadPath = Utils.doUpload(request, pathDir);
        JSONMessage jsonMessage = new JSONMessage();
        jsonMessage.setData(uploadPath);
        return jsonMessage.toString();
    }
}
