package com.jacknic.shop.Entity;


import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "user_group")
public class UserGroupEntity {
    @Id
    @GenericGenerator(name = "idGenerator", strategy = "identity")
    @GeneratedValue(generator = "idGenerator")
    @Column(name = "id", columnDefinition = "INT(10) COMMENT '用户组ID'")
    private Integer id;

    @Column(name = "title", columnDefinition = "VARCHAR(255) DEFAULT '' COMMENT '用户组名称' ")
    private String title;

    @Column(name = "status", columnDefinition = "TINYINT(1) DEFAULT 0 COMMENT '用户组状态'")
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
