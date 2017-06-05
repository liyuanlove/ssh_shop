package com.jacknic.shop.controller.admin;

import com.jacknic.shop.Entity.GoodsEntity;
import com.jacknic.shop.service.GoodsService;
import com.jacknic.shop.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
