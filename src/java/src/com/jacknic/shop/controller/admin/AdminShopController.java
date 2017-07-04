package com.jacknic.shop.controller.admin;

import com.jacknic.shop.entity.GoodsEntity;
import com.jacknic.shop.entity.OrderEntity;
import com.jacknic.shop.service.GoodsService;
import com.jacknic.shop.service.OrderService;
import com.jacknic.shop.utils.JSONMessage;
import com.jacknic.shop.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
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

    private OrderService orderService;

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }


    @RequestMapping("/productsList")
    public String productList(ModelMap modelMap, @RequestParam(name = "page", defaultValue = "1") int page,
                              @RequestParam(name = "pageSize", defaultValue = "12") int pageSize) {
        modelMap.addAttribute("html_title", "商品列表");
        if (pageSize > 60 || pageSize < 12) {
            pageSize = 12;
        }
        Integer[] AllStatus = {-1, 0, 1};//所有状态
        int goodsCount = goodsService.getGoodsCount(AllStatus);
        int currentPage = Utils.getPageNum(page, pageSize, goodsCount);
        int maxPage = Utils.getMaxPage(pageSize, goodsCount);
        List<GoodsEntity> goodsEntityList = goodsService.getGoods(currentPage, pageSize, AllStatus);
        modelMap.addAttribute("goodsList", goodsEntityList);
        modelMap.addAttribute("currentPage", currentPage);
        modelMap.addAttribute("maxPage", maxPage);
        modelMap.addAttribute("goodsCount", goodsCount);
        return "admin/shop/productsList";
    }

    @RequestMapping("/ordersList")
    public String ordersList(ModelMap modelMap, @RequestParam(name = "page", defaultValue = "1") int page,
                             @RequestParam(name = "pageSize", defaultValue = "12") int pageSize) {
        modelMap.addAttribute("html_title", "订单列表");
        if (pageSize > 60 || pageSize < 12) {
            pageSize = 12;
        }
        int ordersCount = orderService.getOrderCount();
        int currentPage = Utils.getPageNum(page, pageSize, ordersCount);
        int maxPage = Utils.getMaxPage(pageSize, ordersCount);
        List<OrderEntity> orderEntityList = orderService.getOrders(currentPage, pageSize);
        modelMap.addAttribute("ordersList", orderEntityList);
        modelMap.addAttribute("currentPage", currentPage);
        modelMap.addAttribute("maxPage", maxPage);
        modelMap.addAttribute("orderCount", ordersCount);
        return "admin/shop/orderList";
    }

    @RequestMapping("/delete/{gid}")
    public String delByGid(@PathVariable(name = "gid") int gid) {
        int result = goodsService.delGoodsById(gid);
        return "redirect:/admin/shop/productsList";
    }

    @RequestMapping("/deleteAll")
    public String delAll(@RequestParam(name = "ids") String ids_str) {
        String[] ids = ids_str.split(",");
        for (String id : ids) {
            delByGid(Integer.valueOf(id));
        }

        return "redirect:/admin/shop/productsList";
    }

    @RequestMapping("/drop/{gid}")
    public String drop(@PathVariable(name = "gid") int gid) {
        int result = goodsService.updateStatus(gid, -1);
        return "redirect:/admin/shop/productsList";
    }

    @RequestMapping("/dropAll")
    public String dropAll(@RequestParam(name = "ids") String ids_str) {
        String[] ids = ids_str.split(",");
        for (String id : ids) {
            drop(Integer.valueOf(id));
        }
        return "redirect:/admin/shop/productsList";
    }

    @RequestMapping("/up/{gid}")
    public String up(@PathVariable(name = "gid") int gid) {
        int result = goodsService.updateStatus(gid, 0);
        return "redirect:/admin/shop/productsList";
    }

    @RequestMapping("/upAll")
    public String upAll(@RequestParam(name = "ids") String ids_str) {
        String[] ids = ids_str.split(",");
        for (String id : ids) {
            up(Integer.valueOf(id));
        }
        return "redirect:/admin/shop/productsList";
    }

    @GetMapping("/add")
    public String add() {
        return "admin/shop/add";
    }

    @RequestMapping("/edit/{gid}")
    public String edit(@PathVariable(name = "gid") int gid, ModelMap modelMap) {
        GoodsEntity goods = goodsService.getGoodsById(gid);
        modelMap.addAttribute("goods", goods);
        return "admin/shop/edit";
    }

    @PostMapping("/edit/{gid}")
    public String doEdit(@PathVariable(name = "gid") int gid, ModelMap modelMap, GoodsEntity goodsTemp) {
        GoodsEntity goods = goodsService.getGoodsById(gid);
        goods.setPrice(goodsTemp.getPrice());
        goods.setHeaderImg(goodsTemp.getHeaderImg());
        goods.setIntro(goodsTemp.getIntro());
        goods.setNum(goodsTemp.getNum());
        goods.setTitle(goodsTemp.getTitle());
        goodsService.update(goods);
        modelMap.addAttribute("goods", goods);
        modelMap.addAttribute("msg", goods.getTitle() + "商品信息更新成功");
        return "admin/shop/edit";
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
    @RequestMapping("/upload/")
    public String upload(HttpServletRequest request) {
        String pathDir = "/upload/goods/img/";
        String uploadPath = Utils.doUpload(request, pathDir);
        JSONMessage jsonMessage = new JSONMessage();
        if (StringUtils.isEmpty(uploadPath)) {
            jsonMessage.setSuccess(false);
        } else {
            jsonMessage.setData(uploadPath);
        }
        System.out.println(jsonMessage);
        System.out.println(uploadPath);
        return jsonMessage.toString();
    }
}
