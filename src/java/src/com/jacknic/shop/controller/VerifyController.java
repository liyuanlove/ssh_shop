package com.jacknic.shop.controller;

import com.jacknic.shop.entity.UserEntity;
import com.jacknic.shop.service.UserService;
import com.jacknic.shop.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * <h1>验证模块</h1>
 * 包括用户登录注册，验证码验证等
 */
@Controller
@RequestMapping("/verify")
public class VerifyController {

    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 用户登陆页
     */
    @GetMapping("/login")
    public String login(ModelMap modelMap) {
        modelMap.addAttribute("html_title", "用户登录");
        return "verify/login";
    }


    /**
     * 用户登录处理
     *
     * @param username 用户名
     * @param password 密码
     * @return 登录处理后的页面
     */
    @PostMapping(value = "/login")
    public String doLogin(
            @RequestParam(name = "username", required = false, defaultValue = "") String username,
            @RequestParam(name = "password", required = false, defaultValue = "") String password,
            HttpServletRequest request,
            ModelMap modelMap
    ) {

        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            modelMap.addAttribute("error_msg", "用户名密码不能为空！");
            modelMap.addAttribute("html_title", "用户登录");
            return "verify/login";
        }
        UserEntity userEntity = userService.getUser(username, password);
        if (userEntity == null) {
            //登录失败
            modelMap.addAttribute("error_msg", "用户名或密码有误！");
            modelMap.addAttribute("html_title", "用户登录失败");
            return "verify/login";
        } else {
            request.getSession().setAttribute("user", userEntity);
            String returnURL = request.getParameter("returnURL");
            if (!StringUtils.isEmpty(returnURL)) {
                //登录成功并跳转
                return "redirect:" + returnURL;
            } else {
                //无转链接，跳回首页
                return "redirect:/";
            }
        }

    }

    /**
     * 注销登录
     **/
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return "redirect:/";
    }

    /**
     * 用户注册页
     **/
    @GetMapping(value = "/register")
//     produces = "text/html;charset=UTF-8"
    public String register(ModelMap modelMap) {
        modelMap.addAttribute("html_title", "用户注册");
        return "verify/register";
    }

    /**
     * 用户注册处理页
     **/
    @PostMapping("/register")
    public String doRegister(HttpServletRequest request, ModelMap modelMap) {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("map的大小为" + modelMap.size());
        if (!verifyCode(request)) {
            modelMap.addAttribute("error_msg", "验证码有误！");
            return "verify/register";
        }
        if (StringUtils.isEmpty(userName) || StringUtils.isEmpty(password)) {
            modelMap.addAttribute("error_msg", "用户密码均不能为空！");
            return "verify/register";
        } else if (userName.length() > 10 || userName.length() < 3 || password.length() > 18 || password.length() < 6) {
            modelMap.addAttribute("error_msg", "用户名或密码长度不合法！");
            return "verify/register";
        }
        UserEntity alreadyHas = userService.getUserByName(userName);
        if (alreadyHas == null) {
            UserEntity userEntity = new UserEntity();
            userEntity.setName(userName);
            userEntity.setPassword(Utils.password(password));
            userEntity.setRegIp(request.getRemoteHost());
            Integer save = userService.save(userEntity);
            UserEntity user = userService.getUserById(save);
            //自动登录
            request.getSession().setAttribute("user", user);
            return "redirect:/user/";
        } else {
            modelMap.addAttribute("error_msg", "该用户名已被注册，请重新选择注册名！");
            return "verify/register";
        }
    }

    /**
     * 验证码页
     **/
    @RequestMapping(value = "/captcha")
    public void captcha(HttpServletResponse response, HttpServletRequest request) {
        int img_width = 80;
        int img_height = 20;
        BufferedImage bufferedImage = new BufferedImage(img_width, img_height, BufferedImage.TYPE_INT_RGB);
        Graphics g = bufferedImage.getGraphics();
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, img_width, img_height);
        g.setColor(Color.BLACK);
        String str = "ABCDEFGHJKLMNPQSRTUVWYZX23456789";
        HttpSession session = request.getSession();
        int font_size = 18;
        g.setFont(new Font(null, Font.PLAIN, font_size));
        StringBuilder str_code = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            int position = (int) (Math.random() * str.length());
            char c = str.charAt(position);
            str_code.append(c);
            g.drawString(c + "", 3 + font_size * i, font_size);
            g.drawLine(position + 3, position, img_width, img_height);
        }
        session.setAttribute("code", str_code.toString());
        try {
            response.setContentType("image/png");
            ImageIO.write(bufferedImage, "png", response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 检验验证码页
     **/
    @RequestMapping("/checkCode")
    @ResponseBody
    public String checkCode(HttpServletRequest request) {
        return String.valueOf(verifyCode(request));
    }

    /**
     * 检验验证码
     *
     * @param request
     * @return
     */
    private boolean verifyCode(HttpServletRequest request) {
        String code = request.getParameter("code");
        String session_code = (String) request.getSession().getAttribute("code");
        return null != session_code && session_code.equalsIgnoreCase(code);
    }


}
