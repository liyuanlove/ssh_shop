package com.jacknic.shop.utils;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 订单描述
 */
public class OrderDescription {
    @JSONField(name = "gid")
    private int gid;
    @JSONField(name = "num")
    private int num;

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
