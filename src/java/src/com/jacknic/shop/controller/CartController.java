package com.jacknic.shop.controller;

import com.jacknic.shop.entity.CartEntity;
import com.jacknic.shop.entity.GoodsEntity;
import com.jacknic.shop.entity.UserEntity;
import com.jacknic.shop.service.CartService;
import com.jacknic.shop.service.GoodsService;
import com.jacknic.shop.utils.JSONMessage;
import com.jacknic.shop.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

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
    @RequestMapping("/add/{gid}")
    public String add(@PathVariable(name = "gid") int gid, HttpServletRequest request) {
        GoodsEntity goods = goodsService.getGoodsById(gid);
        UserEntity user = (UserEntity) request.getSession().getAttribute("user");
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
        return "redirect:/cart/list";
    }

    /**
     * 从购物车中移除
     */
    @RequestMapping("/remove/{gid}")
    public String remove(@PathVariable(name = "gid") int gid, HttpServletRequest request) {
        GoodsEntity goods = goodsService.getGoodsById(gid);
        if (goods != null) {
            UserEntity userEntity = Utils.getCurrentUser(request);
            int result = cartService.delById(userEntity.getId(), gid);
        }
        return "redirect:/cart/list";
    }

    /**
     * 用户购物车页
     **/
    @RequestMapping(value = {"/", "/list"})
    public String cart(HttpServletRequest request, ModelMap modelMap) {
        UserEntity user = Utils.getCurrentUser(request);
        modelMap.addAttribute("html_title", "购物车");
        if (user == null) return "redirect:/verify/login";
        List<CartEntity> cart = cartService.getCartByUid(user.getId());
        List<Integer> gids = new ArrayList<Integer>();
        for (CartEntity cartEntity : cart) {
            gids.add(cartEntity.getGid());
        }
        if (!cart.isEmpty()) {
            List<GoodsEntity> goodsByIds = goodsService.getGoodsByIds(gids);
            modelMap.addAttribute("goodsList", goodsByIds);
            modelMap.addAttribute("cart", cart);
        }
        return "cart/cart";
    }

    /**
     * 清空购物车
     */
    @RequestMapping("/clear")
    public String clear(HttpServletRequest request) {
        UserEntity userEntity = Utils.getCurrentUser(request);
        cartService.clear(userEntity.getId());
        return "redirect:/cart/";
    }

}
