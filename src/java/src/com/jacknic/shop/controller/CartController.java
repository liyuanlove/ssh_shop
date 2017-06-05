package com.jacknic.shop.controller;

import com.jacknic.shop.Entity.CartEntity;
import com.jacknic.shop.Entity.GoodsEntity;
import com.jacknic.shop.Entity.UserEntity;
import com.jacknic.shop.service.CartService;
import com.jacknic.shop.service.GoodsService;
import com.jacknic.shop.utils.JSONMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 购物车模块
 */
@Controller
@RequestMapping("/cart")
public class CartController {
    private GoodsService goodsService;
    private CartService cartService;

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    /**
     * 添加到购物车
     */
    @ResponseBody
    @RequestMapping("/add/{gid}")
    public String add(@PathVariable(name = "gid") int gid, HttpServletRequest request) {
        GoodsEntity goods = goodsService.getGoodsById(gid);
        UserEntity user = (UserEntity) request.getSession().getAttribute("user");
        System.out.println(cartService.getCount(user.getId()));
        JSONMessage msg = new JSONMessage();
        if (goods != null) {
            CartEntity cartEntity = new CartEntity();
            cartEntity.setNum(1);
            cartEntity.setGid(gid);
            cartEntity.setUid(user.getId());
            cartService.add(cartEntity);
            msg.setData(goods.getTitle() + "加入购物车成功");
        } else {
            msg.setSuccess(false);
            msg.setData("添加到购物车失败！");
        }
        return msg.toString();
    }

    /**
     * 从购物车中移除
     */
    @RequestMapping("/remove/{gid}")
    public String remove(@PathVariable(name = "gid") int gid, ModelMap modelMap, HttpServletRequest request) {
        GoodsEntity goods = goodsService.getGoodsById(gid);
        if (goods != null) {
            modelMap.addAttribute("html_title", "移除成功");
            HttpSession session = request.getSession();
        }
        return "cart/add";
    }

    /**
     * 用户购物车页
     **/
    @RequestMapping(value = {"/", "/list"})
    public String cart() {
        return "cart/cart";
    }

}
