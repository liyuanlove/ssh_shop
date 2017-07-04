package com.jacknic.shop.controller;

import com.jacknic.shop.entity.GoodsEntity;
import com.jacknic.shop.service.GoodsService;
import com.jacknic.shop.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * 商店模块
 */
@Controller
@RequestMapping("/shop")
public class ShopController {

    private GoodsService goodsService;

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    /**
     * 商品列表页
     */
    @RequestMapping(value = {"/product", "/"})
    public String goods(ModelMap modelMap, @RequestParam(name = "page", defaultValue = "1") int page,
                        @RequestParam(name = "pageSize", defaultValue = "12") int pageSize) {
        modelMap.addAttribute("html_title", "产品展示");
        if (pageSize > 60 || pageSize < 12) {
            pageSize = 12;
        }
        Integer[] status = {0, 1};
        int goodsCount = goodsService.getGoodsCount(status);
        int currentPage = Utils.getPageNum(page, pageSize, goodsCount);
        int maxPage = Utils.getMaxPage(pageSize, goodsCount);
        List<GoodsEntity> goods = goodsService.getGoods(currentPage, pageSize, status);
        modelMap.addAttribute("goodsList", goods);
        modelMap.addAttribute("goodsCount", goodsCount);
        modelMap.addAttribute("currentPage", currentPage);
        modelMap.addAttribute("maxPage", maxPage);
        return "shop/productList";
    }


    /**
     * 商品详情页
     */
    @RequestMapping("/product/{gid}")
    public String details(ModelMap modelMap, @PathVariable(name = "gid") Integer gid) {
        GoodsEntity goods = goodsService.getGoodsById(gid);
        if (goods == null || goods.getStatus().equals(-1)) {
            modelMap.addAttribute("html_title", "无法获取该商品信息");
            modelMap.addAttribute("error_title", "无法获取该商品信息");
            modelMap.addAttribute("error_msg", "获取商品信息失败，可能该商品已下架！");
            return "error_default";
        } else {
            modelMap.addAttribute("html_title", goods.getTitle() + " 商品详情页");
            modelMap.addAttribute("goods", goods);
            return "shop/productDetails";
        }

    }

    /**
     * 商品搜索页
     */
    @RequestMapping("/search/")
    public String search(String keyword) {
        System.out.println("获取到的值为：" + keyword);
        if (StringUtils.isEmpty(keyword)) {
            return "redirect:/shop/";
        } else {
            return "redirect:/shop/search/" + keyword + "/";
        }
    }

    /**
     * 商品搜索页
     */
    @RequestMapping("/search/{keyword}/")
    public String searchKeyword(ModelMap modelMap, @RequestParam(name = "page", defaultValue = "1") int page,
                                @RequestParam(name = "pageSize", defaultValue = "12") int pageSize,
                                @PathVariable(name = "keyword") String keyword) throws UnsupportedEncodingException {
        System.out.println("原关键词是：" + keyword);
        try {
            keyword = new String(keyword.getBytes("ISO8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println("转换后关键词是：" + keyword);
        int goodsCount = goodsService.countByKeyword(keyword);
        int maxPage = Utils.getMaxPage(pageSize, goodsCount);
        int currentPage = Utils.getPageNum(page, pageSize, goodsCount);
        List<GoodsEntity> goodsEntities = goodsService.searchByKeyword(keyword, currentPage, pageSize);
        modelMap.addAttribute("goodsList", goodsEntities);
        modelMap.addAttribute("goodsCount", goodsCount);
        modelMap.addAttribute("maxPage", maxPage);
        modelMap.addAttribute("currentPage", currentPage);
        return "shop/productList";
    }
}
