package com.jacknic.shop.utils;

import com.jacknic.shop.entity.UserEntity;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.util.FileCopyUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;

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

    /**
     * 文件上传处理
     *
     * @param request
     * @param pathDir
     * @return
     */
    public static String doUpload(HttpServletRequest request, String pathDir) {
        //判断是否是文件上传请求
        if (ServletFileUpload.isMultipartContent(request)) {
            // 创建文件上传处理器
            ServletFileUpload upload = new ServletFileUpload();
            //限制单个上传文件的大小
            upload.setFileSizeMax(1L << 24);
            try {
                // 解析请求
                FileItemIterator iter = upload.getItemIterator(request);
                while (iter.hasNext()) {
                    FileItemStream item = iter.next();
                    if (!item.isFormField()) {
                        String realPath = request.getSession().getServletContext().getRealPath(pathDir);
                        File parent = new File(realPath);
                        if (!parent.exists()) {
                            if (!parent.mkdirs()) {
                                System.out.println("创建文件夹失败！");
                                return null;
                            }
                        }

                        int index = item.getName().lastIndexOf('.');
                        StringBuilder extName = new StringBuilder("");
                        if (index != -1) {
                            extName.append(item.getName().substring(index));
                        }
                        String fileName = System.nanoTime() + extName.toString();
                        File save = new File(parent, fileName);
                        FileOutputStream fileOutputStream = new FileOutputStream(save);
                        FileCopyUtils.copy(item.openStream(), fileOutputStream);
                        return pathDir + fileName;
                    }
                }
            } catch (Exception ignored) {
                ignored.printStackTrace();
            }
        }
        System.out.println("不是上传文件");
        return null;
    }

    /**
     * 获取当前登录用户
     */
    public static UserEntity getCurrentUser(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return (UserEntity) session.getAttribute("user");
    }
}
