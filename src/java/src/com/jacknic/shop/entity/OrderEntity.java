package com.jacknic.shop.entity;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "`order`")
public class OrderEntity {

    @Id
    @Column(name = "oid", columnDefinition = "INT(10) COMMENT '订单ID'")
    @GenericGenerator(name = "idGenerator", strategy = "identity")
    @GeneratedValue(generator = "idGenerator")
    private Integer orderId;

    @Column(name = "order_num", columnDefinition = "TEXT COMMENT '订单号'", nullable = false)
    private String orderNumber;

    @Column(name = "uid", columnDefinition = "INT(10) COMMENT '用户ID'", nullable = false)
    private Integer uid;

    @Column(name = "info", columnDefinition = "TEXT  COMMENT '订单商品描述信息'", nullable = false)
    private String info;

    @Column(name = "goods_info", columnDefinition = "TEXT  COMMENT '订单商品信息'", nullable = false)
    private String goodsInfo;

    @Column(name = "total_money", columnDefinition = "FLOAT COMMENT '订单总计金额'", nullable = false)
    private Float money;

    @Column(name = "aid", columnDefinition = " INT(10) COMMENT '订单配送地址ID'", nullable = false)
    private Integer addressId;

    /**
     * 状态取消订单（-1），未支付（0），已支付（1）
     */
    @Column(name = "status", columnDefinition = " INT(1) COMMENT '订单状态'", nullable = false)
    private Integer status;

    @Column(name = "otime", columnDefinition = " BIGINT(20) COMMENT '订单完成时间'", nullable = false)
    private Long finishTime;

    @Column(name = "pay_method", columnDefinition = " INT(1) COMMENT '支付方式'", nullable = false)
    private Integer payMethod;

    @Column(name = "post_time", columnDefinition = " BIGINT(20) COMMENT '订单提交时间'", nullable = false)
    private Long postTime;


    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(Long finishTime) {
        this.finishTime = finishTime;
    }

    public Integer getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(Integer payMethod) {
        this.payMethod = payMethod;
    }

    public Long getPostTime() {
        return postTime;
    }

    public void setPostTime(Long postTime) {
        this.postTime = postTime;
    }

    public String getGoodsInfo() {
        return goodsInfo;
    }

    public void setGoodsInfo(String goodsInfo) {
        this.goodsInfo = goodsInfo;
    }

    @Override
    public String toString() {
        return "OrderEntity{" +
                "orderId=" + orderId +
                ", orderNumber='" + orderNumber + '\'' +
                ", uid=" + uid +
                ", info='" + info + '\'' +
                ", money=" + money +
                ", addressId=" + addressId +
                ", status=" + status +
                ", finishTime=" + finishTime +
                ", payMethod=" + payMethod +
                ", postTime=" + postTime +
                '}';
    }

}
