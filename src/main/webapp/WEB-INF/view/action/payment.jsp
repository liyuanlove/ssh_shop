<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <section class="panel tasks-widget panel-import">
                <header class="panel-heading text-center">
                    支付订单
                </header>
                <div class="panel-body">
                    <div class="task-content">
                        <ul class="task-list">
                            <li>
                                <div class="task-title">
                                        <span class="task-title-sp">
                                        订单描述：${order.info}
                                        </span>
                                    <div class="pull-right">
                                        应支付金额<span class="pro-price">${order.money}</span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="add-task-row">
                        <div class="mail-option">
                            <div class="btn-group" id="refresh">
                                共计金额：<span class="pro-price">${order.money}</span>
                            </div>
                            <div class="btn-group">
                                用户余额：<span class="pro-price">￥${sessionScope.user.money}</span>
                            </div>
                            <div class="alert alert-danger ${(sessionScope.user.money - order.money)<0 ?"":"hidden"}">
                                用户余额<code>${sessionScope.user.money}</code>元，不足以支付该订单！请先充值账户
                            </div>
                            <form action="/action/payment/${order.orderId}" method="post">
                                <button type="submit"
                                        class="btn btn-danger pull-right ${(sessionScope.user.money - order.money)<0 ?"hidden":""}">
                                    立即支付
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>