package com.jacknic.shop.service;

import com.jacknic.shop.Entity.GoodsEntity;
import com.jacknic.shop.dao.GoodsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 商品
 */
@Transactional
@Service
public class GoodsService {
    private GoodsDAO goodsDAO;

    @Autowired
    public void setUserDAO(GoodsDAO goodsDAO) {
        this.goodsDAO = goodsDAO;
    }

    /**
     * 保存商品
     *
     * @param goodsEntity 商品实体
     * @return 插入后的ID
     */
    public Integer save(GoodsEntity goodsEntity) {
        return goodsDAO.save(goodsEntity);
    }

    /**
     * 更新商品
     *
     * @param goodsEntity 商品实体
     */
    public void update(GoodsEntity goodsEntity) {
        goodsDAO.update(goodsEntity);
    }

    /**
     * 指定ID查询商品信息
     *
     * @param gid 商品ID
     * @return 商品实体
     */
    public GoodsEntity getGoodsById(int gid) {
        return goodsDAO.getGoodsById(gid);
    }

    /**
     * 指定ID删除商品信息
     *
     * @param gid 商品ID
     */
    public int delGoodsById(int gid) {
        return goodsDAO.delGoodsById(gid);
    }

    public List<GoodsEntity> searchByKeyword(String keyword, int page, int pageSize) {
        return goodsDAO.searchByKeyword(keyword, page, pageSize);
    }


    /**
     * 获取默认商品列表信息
     *
     * @param page     分页
     * @param pageSize 分页大小
     * @return 商品信息列表
     */
    public List<GoodsEntity> getGoods(int page, int pageSize) {
        return goodsDAO.getGoods(page, pageSize);
    }


    /**
     * 获取商品总数
     *
     * @return
     */
    public int getGoodsCount() {
        return goodsDAO.getGoodsCount();
    }

    public int countByKeyword(String keyword) {
        return goodsDAO.getGoodsCountByKeyword(keyword);
    }
}
