package com.jacknic.shop.service;

import com.jacknic.shop.entity.CartEntity;
import com.jacknic.shop.dao.CartDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 购物车
 */
@Transactional
@Service
public class CartService {
    private CartDAO cartDAO;

    @Autowired
    public void setCartDAO(CartDAO cartDAO) {
        this.cartDAO = cartDAO;
    }

    /**
     * 添加到购物车
     */
    public Integer add(CartEntity cartEntity) {
        return cartDAO.add(cartEntity);
    }

    public Integer getCount(Integer uid) {
        return cartDAO.getCount(uid);
    }

    public List<CartEntity> getCartByUid(int uid) {
        return cartDAO.getCartListByUid(uid);
    }
}
