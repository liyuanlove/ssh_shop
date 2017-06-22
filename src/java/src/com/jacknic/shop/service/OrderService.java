package com.jacknic.shop.service;

import com.jacknic.shop.dao.OrderDAO;
import com.jacknic.shop.entity.OrderEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 订单处理
 */
@Transactional
@Service
public class OrderService {

    private OrderDAO orderDAO;

    @Autowired
    public void setOrderDAO(OrderDAO orderDAO) {
        this.orderDAO = orderDAO;
    }

    /**
     * 新增订单
     */
    public int add(OrderEntity orderEntity) {
        return orderDAO.add(orderEntity);
    }

    /**
     * 按ID获取订单信息
     */
    public OrderEntity getById(int order_id) {
        return orderDAO.getById(order_id);
    }

    public OrderEntity getByIds(Integer uid, Integer order_id) {
        return orderDAO.getByIds(uid, order_id);
    }

    public void update(OrderEntity orderEntity) {
        orderDAO.update(orderEntity);
    }

    public int getOrderCount() {
        return orderDAO.getOrderCount();
    }

    public List<OrderEntity> getOrders(int currentPage, int pageSize) {
        return orderDAO.getOrders(currentPage, pageSize);
    }
}
