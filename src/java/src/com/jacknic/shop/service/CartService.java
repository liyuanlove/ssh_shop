package com.jacknic.shop.service;

import com.jacknic.shop.Entity.CartEntity;
import com.jacknic.shop.dao.CartDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
}
