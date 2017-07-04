<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="/WEB-INF/view/_Layout/front_profile_side_menu.jsp" %>
        <aside class="profile-info col-lg-9">
            <div class="col-lg-12">
                <section class="panel tasks-widget panel-danger">
                    <header class="panel-heading text-center"> 订单记录</header>
                    <div class="panel-body">
                        <div class="task-content">
                            <ul class="task-list">
                                <c:forEach items="${orderList}" var="order">
                                    <li>
                                        <div class="task-title">
										<span class="task-title-sp">
                                            <a href="#"
                                               title="点击查看订单详情" target="_blank">
                                                    ${order.info}
                                            </a>
										</span>
                                            <div class="pull-right hidden-phone">
                                                <c:choose>

                                                    <c:when test="${order.status == -1}">
                                                        <button class="btn btn-default"><i
                                                                class=" fa fa-close"></i>订单已取消
                                                        </button>
                                                    </c:when>

                                                    <c:when test="${order.status == 0}">
                                                        <a class="btn btn-info" title="立即支付"
                                                           href="${pageContext.request.contextPath}/action/payment/${order.orderId}"><i
                                                                class=" fa fa-paypal"></i>等待支付
                                                        </a>
                                                    </c:when>

                                                    <c:when test="${order.status == 1}">
                                                        <button class="btn btn-success"><span
                                                                class=" glyphicon glyphicon-ok "></span> 完成支付
                                                        </button>
                                                    </c:when>

                                                </c:choose>
                                            </div>
                                        </div>
                                    </li>

                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </section>
            </div>
        </aside>
    </div>
</div>
<link href="${pageContext.request.contextPath}/public/css/tasks.css" rel="stylesheet" type="text/css">
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>