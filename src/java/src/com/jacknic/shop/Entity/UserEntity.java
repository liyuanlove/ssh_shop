package com.jacknic.shop.Entity;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class UserEntity {

    @Id
    @GenericGenerator(name = "idGenerator", strategy = "identity")
    @GeneratedValue(generator = "idGenerator")
    @Column(name = "id", columnDefinition = "INT(10) COMMENT '用户ID'")
    private Integer id;

    @Column(name = "email", columnDefinition = "VARCHAR(255) DEFAULT '' COMMENT '用户邮箱' ", insertable = false)
    private String email;

    @Column(name = "password", nullable = false, columnDefinition = "VARCHAR(32) COMMENT '用户密码'")
    private String password;

    @Column(name = "money", columnDefinition = "FLOAT DEFAULT 0.0 COMMENT '账户余额'", nullable = false, insertable = false)
    private Double money;

    //0未知，1男，2女
    @Column(name = "sex", columnDefinition = "TINYINT(1) DEFAULT 0 COMMENT '性别'", nullable = false, insertable = false)
    private Integer sex;
    //默认0正常
    @Column(name = "status", columnDefinition = "TINYINT(1) DEFAULT 0 COMMENT '用户状态'", nullable = false, insertable = false)
    private Integer status;

    //初始状态、组ID为1是管理员组，2为普通用户
    @Column(name = "group_id", columnDefinition = "INT(10) default 2 COMMENT '用户组ID'", nullable = false, insertable = false)
    private Integer groupId;

    @Column(name = "phone", columnDefinition = "VARCHAR(20) DEFAULT '' COMMENT '用户电话'", insertable = false)
    private String phone;

    @Column(name = "img", columnDefinition = "VARCHAR(255) DEFAULT '/public/img/header.png' COMMENT '用户头像'", insertable = false)
    private String img;

    @Column(name = "name", columnDefinition = "VARCHAR(50) COMMENT '用户名'", nullable = false, unique = true)
    private String name;

    @Column(name = "reg_time", columnDefinition = "INT(10) DEFAULT 0 COMMENT '注册时间'", nullable = false)
    private Integer regTime = (int) (System.currentTimeMillis() / 1000);

    @Column(name = "reg_ip", columnDefinition = "VARCHAR(50) DEFAULT '' COMMENT '注册IP'", insertable = false)
    private String regIp;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer gid) {
        this.groupId = gid;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getRegTime() {
        return regTime;
    }

    public void setRegTime(Integer regTime) {
        this.regTime = regTime;
    }

    public String getRegIp() {
        return regIp;
    }

    public void setRegIp(String regIp) {
        this.regIp = regIp;
    }

    @Override
    public String toString() {
        return "UserEntity{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", money=" + money +
                ", sex=" + sex +
                ", status=" + status +
                ", gid=" + groupId +
                ", phone='" + phone + '\'' +
                ", img='" + img + '\'' +
                ", name='" + name + '\'' +
                ", regTime=" + regTime +
                ", regIp='" + regIp + '\'' +
                '}';
    }
}
