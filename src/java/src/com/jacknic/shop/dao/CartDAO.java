package com.jacknic.shop.dao;

import com.jacknic.shop.entity.CartEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 购物车DAO
 */
@Repository
public class CartDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * 获取当前session
     */
    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 添加到购物车表
     */
    public Integer add(CartEntity cartEntity) {
        CartEntity cartItemById = getCartItemById(cartEntity.getGid(), cartEntity.getUid());
        if (cartItemById != null) {
            cartItemById.setNum(cartItemById.getNum() + 1);
            cartItemById.setCreateTime((int) (System.currentTimeMillis() / 1000));
            getSession().update(cartItemById);
            return cartItemById.getId();
        } else {
            return (Integer) getSession().save(cartEntity);
        }
    }

    /**
     * 按ID获取购物车信息
     */
    public CartEntity getCartItemById(Integer gid, Integer uid) {
        return (CartEntity) getSession().createQuery("from CartEntity where gid=? and uid=?")
                .setInteger(0, gid)
                .setInteger(1, uid)
                .uniqueResult();
    }

    /**
     * 获取指定用户购物车中的商品数
     *
     * @param uid 用户ID
     * @return 商品数
     */
    public Integer getCount(int uid) {
        Long result = (Long) getSession().createQuery("select sum (num) from CartEntity where uid=?")
                .setInteger(0, uid)
                .uniqueResult();
        return result.intValue();

    }


    public List<CartEntity> getCartListByUid(int uid) {
        List list = getSession().createQuery("from CartEntity where uid=? order by gid asc ")
                .setInteger(0, uid)
                .list();
        return list;
    }
}
