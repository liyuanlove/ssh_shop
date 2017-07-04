package com.jacknic.shop.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jacknic.shop.entity.GoodsEntity;
import com.jacknic.shop.entity.OrderEntity;
import com.jacknic.shop.entity.UserEntity;
import com.jacknic.shop.service.CartService;
import com.jacknic.shop.service.GoodsService;
import com.jacknic.shop.service.OrderService;
import com.jacknic.shop.service.UserService;
import com.jacknic.shop.utils.JSONMessage;
import com.jacknic.shop.utils.OrderDescription;
import com.jacknic.shop.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * 操作动作模块
 */
@Controller
@RequestMapping("/action")
public class ActionController {


    private GoodsService goodsService;

    @Autowired
    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    private OrderService orderService;

    @Autowired
    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    private CartService cartService;

    @Autowired
    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    /**
     * 购买单个商品
     */
    @RequestMapping("/buy/{gid}")
    public String buy(@PathVariable(name = "gid") Integer gid, ModelMap modelMap) {
        GoodsEntity goodsById = goodsService.getGoodsById(gid);
        if (goodsById == null) {
            modelMap.addAttribute("html_title", "该商品信息不存在");
            modelMap.addAttribute("error_title", "可惜，该商品信息不存在");
            modelMap.addAttribute("error_msg", "");
            return "error_default";
        }
        modelMap.addAttribute("goods", goodsById);
        return "action/buy";
    }

    /**
     * 下单
     */
    @RequestMapping(value = "/order")
    public String order(HttpServletRequest request, @RequestParam(name = "gid", defaultValue = "0") Integer gid,
                        @RequestParam(name = "num", defaultValue = "1") Integer num) {
        UserEntity user = Utils.getCurrentUser(request);
        GoodsEntity goodsById = goodsService.getGoodsById(gid);
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setInfo(goodsById.getTitle() + " ￥" + goodsById.getPrice() + " * " + num);
        OrderDescription description = new OrderDescription();
        description.setNum(num);
        description.setGid(gid);
        JSONArray desc = new JSONArray();
        desc.add(description);
        orderEntity.setGoodsInfo(desc.toJSONString());
        orderEntity.setMoney(goodsById.getPrice() * num);
        orderEntity.setPayMethod(1);
        orderEntity.setOrderNumber("" + System.nanoTime());
        orderEntity.setPostTime(System.currentTimeMillis());
        orderEntity.setFinishTime(0L);
        orderEntity.setAddressId(12);
        orderEntity.setStatus(0);
        orderEntity.setUid(user.getId());
        int insert_id = orderService.add(orderEntity);
        if (insert_id > 0) {
            String from = request.getParameter("from");
            if ("cart".equalsIgnoreCase(from)) {
                int result = cartService.delById(user.getId(), gid);
                System.out.println("从购物车移除：" + result);
            }
            return "redirect:/action/payment/" + insert_id;
        }
        //失败时添加到购物车
        return "redirect:/cart/add/" + gid;
    }


    /**
     * 支付页
     */
    @GetMapping("/payment/{order_id}")
    public String payment(HttpServletRequest request,
                          ModelMap modelMap,
                          @PathVariable(name = "order_id") Integer order_id) {
        UserEntity old_user = Utils.getCurrentUser(request);
        UserEntity user = userService.getUserById(old_user.getId());
        Utils.updateCurrentUser(request, user);
        OrderEntity orderEntity = orderService.getByIds(user.getId(), order_id);
        System.out.println("当前订单信息：" + orderEntity);
        if (orderEntity == null || orderEntity.getStatus() != 0) {
            modelMap.addAttribute("html_title", "获取订单信息失败");
            modelMap.addAttribute("error_title", "获取订单信息失败");
            modelMap.addAttribute("error_msg", "该订单信息不存在或已经被处理！");
            return "error_default";
        }
        modelMap.addAttribute("html_title", "支付订单");
        modelMap.addAttribute("order", orderEntity);
        return "action/payment";
    }


    private UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /**
     * 支付处理页
     */
    @PostMapping("/payment/{order_id}")
    public String doPayment(HttpServletRequest request,
                            @PathVariable(name = "order_id") Integer order_id,
                            ModelMap modelMap
    ) {
        UserEntity preUser = Utils.getCurrentUser(request);
        UserEntity user = userService.getUserById(preUser.getId());
        Utils.updateCurrentUser(request, user);
        OrderEntity orderEntity = orderService.getById(order_id);
        String goodsInfo = orderEntity.getGoodsInfo();
        System.out.println(orderEntity);
        System.out.println(user);
        if (orderEntity.getStatus() != 0) {
            return "redirect:/action/payment/" + order_id;
        }
        if (orderEntity.getMoney() > user.getMoney()) {
            modelMap.addAttribute("html_title", "支付失败！");
            modelMap.addAttribute("error_title", "支付失败！");
            modelMap.addAttribute("error_msg", "支付订单失败，用户余额不足以支付该订单！");
            return "error_default";
        }
        List<OrderDescription> orderDescriptions = JSONObject.parseArray(goodsInfo, OrderDescription.class);
        GoodsEntity goodsEntity = null;
        OrderDescription orderDescription = null;
        if (orderDescriptions != null && orderDescriptions.size() > 0) {
            orderDescription = orderDescriptions.get(0);
            goodsEntity = goodsService.getGoodsById(orderDescription.getGid());
            if (orderDescription.getNum() > goodsEntity.getNum()) {
                modelMap.addAttribute("html_title", "库存不足！");
                modelMap.addAttribute("error_title", "失败！");
                modelMap.addAttribute("error_msg", "提交订单失败，商城库存不足该订单需求！");
                return "error_default";
            }
        } else {
            modelMap.addAttribute("html_title", "订单信息有误！");
            modelMap.addAttribute("error_title", "失败！");
            modelMap.addAttribute("error_msg", "支付订单失败！");
            return "error_default";
        }
        user.setMoney(user.getMoney() - orderEntity.getMoney());
        goodsEntity.setNum(goodsEntity.getNum() - orderDescription.getNum());
        goodsService.update(goodsEntity);
        userService.update(user);
        orderEntity.setStatus(1);
        orderEntity.setFinishTime(System.currentTimeMillis());
        orderService.update(orderEntity);
        modelMap.addAttribute("html_title", "支付成功！");
        modelMap.addAttribute("error_title", "支付成功！");
        modelMap.addAttribute("error_msg", "支付成功，商品很快就会通过物流传送到你的身边！");
        return "error_default";
    }


    /**
     * 用户物流信息页
     **/
    @RequestMapping("/logistics/{order_id}")
    public String logistics(@PathVariable(name = "order_id") int order_id) {
        return "action/logistics";
    }

    /**
     * 用户购物记录
     **/
    @RequestMapping("/done")
    public String done(ModelMap modelMap, HttpServletRequest request) {
        modelMap.addAttribute("html_title", "购物记录");
        UserEntity currentUser = Utils.getCurrentUser(request);
        List<Integer> status = new ArrayList<Integer>();
        status.add(1);
        List<OrderEntity> orderList = orderService.getListByUid(currentUser.getId(), status);
        modelMap.addAttribute("orderList", orderList);
        return "action/done";
    }

    /**
     * 用户订单记录
     **/
    @RequestMapping("/order_history")
    public String orderHistory(HttpServletRequest request, ModelMap modelMap) {
        UserEntity currentUser = Utils.getCurrentUser(request);
        modelMap.addAttribute("html_title", "订单记录");
        List<Integer> status = new ArrayList<Integer>();
        status.add(-1);
        status.add(0);
        status.add(1);
        List<OrderEntity> orderList = orderService.getListByUid(currentUser.getId(), status);
        modelMap.addAttribute("orderList", orderList);
        return "action/orderHistory";
    }

    /**
     * 处理上传文件
     */
    @ResponseBody
    @PostMapping(value = "/upload")
    public String upload(HttpServletRequest request) {
        UserEntity userEntity = Utils.getCurrentUser(request);
        if (null == userEntity) return "";
        String pathDir = "/upload/" + userEntity.getId() + "/file/";
        String uploadPath = Utils.doUpload(request, pathDir);
        JSONMessage jsonMessage = new JSONMessage();
        if (uploadPath == null) {
            jsonMessage.setSuccess(false);
            jsonMessage.setData("上传文件失败！");
        } else {
            jsonMessage.setData(uploadPath);
        }
        return jsonMessage.toString();

    }

    /**
     * 处理上传图片
     */
    @ResponseBody
    @PostMapping(value = "/upload/image")
    public String uploadImage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        UserEntity userEntity = (UserEntity) session.getAttribute("user");
        if (null == userEntity) return "";
        String pathDir = "/upload/" + userEntity.getId() + "/img/";
        String fileUploadPath = Utils.doUpload(request, pathDir);
        String callback = request.getParameter("CKEditorFuncNum");
        if (fileUploadPath != null && !StringUtils.isEmpty(callback)) {
            //回调编辑器
            return "<script type=\"text/javascript\">" +
                    "window.parent.CKEDITOR.tools.callFunction(" +
                    callback + ",'" + fileUploadPath + "','')"
                    + "</script>";
        }
        return "<script type=\"text/javascript\">;alert(\"非法图片\");</script>";

    }

}
