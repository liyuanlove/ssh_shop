package com.jacknic.shop.dao;

import com.jacknic.shop.entity.OrderEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * orderDAO
 */
@Repository
public class OrderDAO {
    private SessionFactory sessionFactory;


    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public int add(OrderEntity orderEntity) {
        Integer save = (Integer) getSession().save(orderEntity);
        return save == null ? -1 : save;
    }

    public OrderEntity getById(int order_id) {
        return (OrderEntity) getSession()
                .createQuery("from OrderEntity where orderId=?")
                .setInteger(0, order_id)
                .uniqueResult();
    }

    public OrderEntity getByIds(Integer uid, Integer order_id) {
        return (OrderEntity) getSession().createQuery("from OrderEntity where uid=? and orderId=?")
                .setInteger(0, uid)
                .setInteger(1, order_id)
                .uniqueResult();
    }

    public void update(OrderEntity orderEntity) {
        getSession().update(orderEntity);
    }

    public int getOrderCount() {
        Long result = (Long) getSession().createQuery("select count (*) from OrderEntity ").uniqueResult();
        return result == null ? 0 : result.intValue();
    }

    public List<OrderEntity> getOrders(int currentPage, int pageSize) {
        List list = getSession().createQuery("from OrderEntity order by postTime")
                .setFirstResult((currentPage - 1) * pageSize)
                .setMaxResults(pageSize)
                .list();
        return list;
    }
}
