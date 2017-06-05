package com.jacknic.shop.Entity;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "goods")
public class GoodsEntity {

    @Id
    @GenericGenerator(name = "idGenerator", strategy = "identity")
    @GeneratedValue(generator = "idGenerator")
    @Column(name = "gid", columnDefinition = "INT(10) COMMENT '商品ID'")
    private Integer gid;

    @Column(name = "title", columnDefinition = "VARCHAR(255) COMMENT '商品标题'")
    private String title;

    @Column(name = "price", columnDefinition = "FLOAT DEFAULT 0.0 COMMENT '商品价格'")
    private Float price;

    @Column(name = "num", columnDefinition = "INT(10) DEFAULT 0 COMMENT '商品库存'")
    private Integer num;

    @Column(name = "status", columnDefinition = "TINYINT(1) DEFAULT 0 COMMENT '商品状态'")
    private Integer status;

    @Column(name = "recommend", columnDefinition = "TINYINT(1) DEFAULT 0 COMMENT '商品推荐等级'")
    private Integer recommend;

    @Column(name = "intro", columnDefinition = "TEXT COMMENT '商品详情'")
    private String intro;

    @Column(name = "cid", columnDefinition = "INT(10) DEFAULT 0 COMMENT '商品分类ID'")
    private Integer cid;

    @Column(name = "h_img", columnDefinition = "TEXT COMMENT '商品标题图地址'")
    private String headerImg;

    @Column(name = "ctime", nullable = false, columnDefinition = "BIGINT(20) DEFAULT 0 COMMENT '商品创建时间'")
    private Long ctime;

    @Column(name = "utime", nullable = false, columnDefinition = "BIGINT(20) DEFAULT 0 COMMENT '商品修改时间'")
    private Long utime;

    public GoodsEntity() {
        //默认时间
        ctime = System.currentTimeMillis();
        utime = System.currentTimeMillis();
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getRecommend() {
        return recommend;
    }

    public void setRecommend(Integer recommend) {
        this.recommend = recommend;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getHeaderImg() {
        return headerImg;
    }

    public void setHeaderImg(String headerImg) {
        this.headerImg = headerImg;
    }

    public Long getCtime() {
        return ctime;
    }

    public void setCtime(Long ctime) {
        this.ctime = ctime;
    }

    public Long getUtime() {
        return utime;
    }

    public void setUtime(Long utime) {
        this.utime = utime;
    }

    @Override
    public String toString() {
        return "GoodsEntity{" +
                "gid=" + gid +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", num=" + num +
                ", status=" + status +
                ", recommend=" + recommend +
                ", intro='" + intro + '\'' +
                ", cid=" + cid +
                ", headerImg='" + headerImg + '\'' +
                ", ctime=" + ctime +
                ", utime=" + utime +
                '}';
    }
}
