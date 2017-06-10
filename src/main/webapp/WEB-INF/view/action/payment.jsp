<%@ page import="com.jacknic.shop.entity.GoodsEntity" %>
<%@ page import="com.jacknic.shop.entity.UserEntity" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <section class="panel tasks-widget panel-import">
                <header class="panel-heading text-center">
                    购物清单
                </header>
                <div class="panel-body">
                    <div class="task-content">
                        <ul class="task-list">
                            <c:forEach items="list" var="goods">

                            </c:forEach>
                            <%
                                UserEntity user = (UserEntity) session.getAttribute("user");
                                int order = 1;
                                Float money_total = 0.0f;
                                List<GoodsEntity> list = (List<GoodsEntity>) session.getAttribute("list");
                                if (list != null) {
                                    for (GoodsEntity goodsEntity : list
                                            ) {
                            %>
                            <li>
                                <div class="task-title">
                                        <span class="task-title-sp">
                                            <%=order%>. <a
                                                href="${pageContext.request.contextPath}/shop/product/<%=goodsEntity.getGid()%>"
                                                title="点击查看商品详情"
                                                target="_blank"><%=goodsEntity.getTitle()%></a>
                                        </span>
                                    <div class="pull-right">
                                        <span class="pro-price">￥<%=goodsEntity.getPrice()%></span>
                                    </div>
                                </div>
                            </li>
                            <%
                                        money_total += goodsEntity.getPrice();
                                        order++;
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <div class="add-task-row">
                        <div class="mail-option">
                            <div class="btn-group" id="refresh">
                                共计金额：<span class="pro-price"><%=money_total%></span>
                            </div>
                            <div class="btn-group">
                                用户余额：<span class="pro-price">￥${sessionScope.user.money}</span>
                            </div>
                            <div class="btn-group">
                                支付后结余：<span
                                    class="pro-price">￥<%=user.getMoney() - money_total%></span>
                            </div>
                            <a href="order.html?a=order&order_id=${sessionScope.order_id}"
                               class="btn mini btn-danger right <%=(user.getMoney() - money_total<0)?"disabled":""%>">
                                <%=(user.getMoney() - money_total < 0) ? "余额不足无法完成支付！" : "点击支付"%>
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>