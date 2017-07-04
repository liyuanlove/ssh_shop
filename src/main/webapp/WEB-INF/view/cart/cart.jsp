<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <h2>我的购物车</h2>
    </div>
    <div class="row">
        <div class="col-lg-12 ${empty goodsList?"hidden":""}">
            <section class="panel tasks-widget">
                <div class="panel-body">
                    <div class="task-content">
                        <ul class="task-list">
                            <c:set var="item_num" value="0"/>
                            <c:forEach items="${goodsList}" var="order">
                                <li class="cart_item">
                                    <form action="${pageContext.request.contextPath}/action/order?from=cart"
                                          method="post">
                                        <div class="task-title">
                                                ${item_num+1}.
                                            <span class="task-title-sp">
                                                <a href="${pageContext.request.contextPath}/shop/product/${order.gid}"
                                                   title="点击查看商品详情"
                                                   target="_blank">${order.title}</a>
                                        </span>
                                            <label>
                                                <input type="hidden" name="gid" value="${cart.get(item_num).gid}">
                                                <input type="number" name="num" value="${cart.get(item_num).num}">
                                            </label>
                                                    <div class="pull-right">
                                                <button class="btn btn-success" type="submit">
                                                    <i class="fa fa-shopping-cart "></i> 立即下单
                                                </button>
                                                        <a href="/cart/remove/${order.gid}" class="btn btn-danger"
                                                           title="从购物车移除该商品">
                                                            <i class="fa fa-trash-o "></i> 移除该项
                                                        </a>
                                            </div>
                                        </div>
                                    </form>
                                </li>
                                <c:set var="item_num" value="${item_num+1}"/>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="add-task-row pull-right">
                        <div class="btn-group" id="refresh">
                            <a class="btn mini tooltips" href="?refresh"
                               data-original-title="Refresh">
                                <i class=" fa fa-refresh"></i>刷新
                            </a>
                        </div>
                        <div class="btn " id="clear">
                            <a class="btn btn-danger" href="${pageContext.request.contextPath}/cart/clear">
                                <i class="fa fa-trash-o "></i> 清空购物车
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <c:if test="${cart == null||empty cart}">
            <div class="col-md-4 col-md-offset-4">
                <h1><span class="glyphicon glyphicon-shopping-cart"></span>购物车为空</h1>
                <a class="btn btn-danger" href="${pageContext.request.contextPath}/shop/">马上去购物</a>
                <a class="btn btn-success" href="${pageContext.request.contextPath}/action/done">查看购物记录</a>
            </div>
        </c:if>
    </div>
</div>

<script>
    //
</script>
<link href="${pageContext.request.contextPath}/public/css/tasks.css" rel="stylesheet" type="text/css">
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>