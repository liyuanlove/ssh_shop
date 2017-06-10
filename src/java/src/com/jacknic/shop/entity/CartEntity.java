package com.jacknic.shop.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * 购物车条目实体
 */
@Entity
@Table(name = "cart")
public class CartEntity {

    @Id
    @GenericGenerator(name = "idGenerator", strategy = "identity")
    @GeneratedValue(generator = "idGenerator")
    @Column(name = "id", columnDefinition = "INT(10) COMMENT '条目ID'")
    private Integer id;

    @Column(name = "gid", columnDefinition = "INT(10) COMMENT '商品ID'", nullable = false, updatable = false)
    private Integer gid;

    @Column(name = "uid", columnDefinition = "INT(10) COMMENT '所有者用户ID'", nullable = false, updatable = false)
    private Integer uid;

    @Column(name = "ctime", columnDefinition = "INT(10) COMMENT '创建时间'", nullable = false)
    private Integer createTime = (int) (System.currentTimeMillis() / 1000);

    @Column(name = "num", columnDefinition = "INT(10) COMMENT '数量'", nullable = false)
    private Integer num;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Integer createTime) {
        this.createTime = createTime;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}
