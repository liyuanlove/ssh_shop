package com.jacknic.shop.service;

import com.jacknic.shop.entity.UserEntity;
import com.jacknic.shop.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户
 */
@Transactional
@Service
public class UserService {
    private UserDAO userDAO;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    /**
     * 保存用户
     *
     * @param userEntity 用户实体
     * @return 插入后的ID
     */
    public Integer save(UserEntity userEntity) {
        return userDAO.save(userEntity);
    }

    /**
     * 查询所有
     *
     * @param currentPage
     * @param pageSize
     */
    public List<UserEntity> getUsers(int currentPage, int pageSize) {
        return userDAO.getUsers(currentPage, pageSize);
    }

    /**
     * 用户登录
     *
     * @param username 用户名
     * @param password 密码
     * @return 用户对象
     */
    public UserEntity getUser(String username, String password) {
        return userDAO.getUser(username, password);
    }

    /**
     * 用户登录
     */
    public UserEntity saveUser(UserEntity userEntity) {
        return userDAO.saveUser(userEntity);
    }

    /**
     * 按用户名查找用户
     *
     * @param userName 用户名
     * @return 用户实体
     */
    public UserEntity getUserByName(String userName) {
        return userDAO.getUserByName(userName);
    }

    public int getUsersCount() {
        return userDAO.getUsersCount();
    }

    public int delUserById(int id) {
        userDAO.delUserById(id);
        return 0;
    }
}
