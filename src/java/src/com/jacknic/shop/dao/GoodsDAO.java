package com.jacknic.shop.dao;

import com.jacknic.shop.entity.GoodsEntity;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 商品DAO
 */
@Repository
public class GoodsDAO {

    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 保存商品
     */
    public Integer save(GoodsEntity goodsEntity) {
        return (Integer) getSession().save(goodsEntity);
    }

    /**
     * 查询所有商品
     */
    public List<GoodsEntity> getGoods(int page, int pageSize) {

        return this.getSession().createQuery("from GoodsEntity order by utime desc ")
                .setFirstResult((page - 1) * pageSize)
                .setMaxResults(pageSize)
                .list();
    }

    /**
     * 按ID获取商品信息
     *
     * @param gid 商品id
     * @return 商品实体
     */
    public GoodsEntity getGoodsById(int gid) {
        return (GoodsEntity) getSession().createQuery("from GoodsEntity where gid=?").setParameter(0, gid).uniqueResult();
    }

    /**
     * 更新商品信息
     *
     * @param goodsEntity 商品实体
     */
    public void update(GoodsEntity goodsEntity) {
        goodsEntity.setUtime(System.currentTimeMillis());
        getSession().update(goodsEntity);
    }

    /**
     * 删除商品
     *
     * @param gid 商品ID
     * @return
     */
    public int delGoodsById(int gid) {
        return getSession().createQuery("delete GoodsEntity where gid=?")
                .setInteger(0, gid)
                .executeUpdate();

    }

    /**
     * 按关键词查找商品
     *
     * @param keyword  关键词
     * @param page     当前页
     * @param pageSize 分页大小
     */
    public List<GoodsEntity> searchByKeyword(String keyword, int page, int pageSize) {
        return getSession().createQuery("from GoodsEntity where title like '%" + keyword + "%'")
                .setFirstResult((page - 1) * pageSize)
                .setMaxResults(pageSize)
                .list();
    }

    /**
     * 商品总数
     *
     * @return
     */
    public int getGoodsCount() {
        Long count = (Long) getSession().createQuery("select count(*) from GoodsEntity").uniqueResult();
        return count == null ? 0 : count.intValue();
    }

    /**
     * 含相关关键词的商品总数
     *
     * @param keyword 关键词
     * @return 总数
     */
    public int getGoodsCountByKeyword(String keyword) {
        Long count = (Long) getSession()
                .createQuery("select count(*) from GoodsEntity where title like '%" + keyword + "%'")
                .uniqueResult();
        return count == null ? 0 : count.intValue();
    }

    public List<GoodsEntity> getGoodsByIds(List<Integer> gids) {
        List goodsList = getSession().createQuery("from GoodsEntity where gid in (:gids) order by gid asc ")
                .setParameterList("gids", gids)
                .list();
        return goodsList;
    }

    public int updateStatus(int gid, int status) {
        return getSession().createQuery("update GoodsEntity set status=? where gid=?")
                .setInteger(0, status)
                .setInteger(1, gid)
                .executeUpdate();
    }
}
