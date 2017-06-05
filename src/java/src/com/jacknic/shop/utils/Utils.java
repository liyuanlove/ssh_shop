package com.jacknic.shop.utils;

import static com.jacknic.shop.utils.Encryption.MD5;
import static com.jacknic.shop.utils.Encryption.SHA1;

/**
 * 工具类
 */
public class Utils {
    /**
     * 用户密码加密
     *
     * @param originPassword 密码明文
     * @return 密码密文
     */
    public static String password(String originPassword) {
        return MD5(SHA1(originPassword));
    }

    /**
     * 分页
     *
     * @param currentPage 当前页
     * @param pageSize    分页大小
     * @param itemCount   总条目数
     * @return 合法分页
     */
    public static int getPageNum(int currentPage, int pageSize, int itemCount) {
        int maxPage = getMaxPage(pageSize, itemCount);
        if (currentPage > maxPage) {
            currentPage = maxPage;
        } else if (currentPage < 1) {
            currentPage = 1;
        }
        return currentPage;
    }

    /**
     * 获取最大分页
     *
     * @param pageSize  分页大小
     * @param itemCount 条目总数
     * @return 分页
     */
    public static int getMaxPage(int pageSize, int itemCount) {
        return (itemCount + pageSize - 1) / pageSize;
    }
}
