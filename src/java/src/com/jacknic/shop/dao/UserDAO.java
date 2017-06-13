package com.jacknic.shop.dao;

import com.jacknic.shop.entity.UserEntity;
import com.jacknic.shop.utils.Encryption;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户DAO
 */
@Repository
public class UserDAO {

    @Value("#{configProperties['config.auth_key']}")
    public String auth_key;
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /**
     * 保存用户
     */
    public Integer save(UserEntity userEntity) {
        return (Integer) getSession().save(userEntity);
    }

    /**
     * 查询所有用户
     *
     * @param currentPage
     * @param pageSize
     */
    public List<UserEntity> getUsers(int currentPage, int pageSize) {
        return this.getSession()
                .createCriteria(UserEntity.class)
                .setFirstResult((currentPage - 1) * pageSize)
                .setMaxResults(pageSize)
                .list();
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    /**
     * 用户登录
     *
     * @param username 用户名
     * @return 用户对象
     */
    public UserEntity getUser(String username, String password) {
        String en_password = Encryption.MD5(Encryption.SHA1(password));
        //UserEntity 为hibernate映射的数据表实体类，而不是数据表名
        UserEntity userEntity = (UserEntity) this.getSession().createQuery("FROM UserEntity WHERE name=? AND password=? ")
                .setParameter(0, username)
                .setParameter(1, en_password)
                .uniqueResult();
        return userEntity;
    }

    /**
     * 按用户名查找用户
     *
     * @param userName
     * @return
     */
    public UserEntity getUserByName(String userName) {
        UserEntity userExisted = (UserEntity) getSession().createQuery("FROM UserEntity WHERE name=?")
                .setParameter(0, userName).uniqueResult();
        return userExisted;
    }

    /**
     * 获取用户总数
     *
     * @return 用户总数
     */
    public int getUsersCount() {
        Long count = (Long) getSession().createQuery("select count (*) from UserEntity ").uniqueResult();
        return count.intValue();
    }

    /**
     * 删除指定ID的用户
     *
     * @param id 用户ID
     * @return 影响数据行数
     */
    public int delUserById(int id) {
        return getSession()
                .createQuery("delete UserEntity where id=?")
                .setInteger(0, id)
                .executeUpdate();

    }

    /**
     * 按ID获取用户
     *
     * @param save
     * @return
     */
    public UserEntity getUserById(Integer save) {
        return (UserEntity) getSession().createQuery("from GoodsEntity where id=?").setInteger(0, save).uniqueResult();
    }
}
