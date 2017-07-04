<%--用户信息页侧边菜单--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="profile-nav col-lg-3">
    <section class="panel">
        <div class="user-heading round">
            <a href="#">
                <img src="<%=request.getContextPath()%>/public/images/header.png" alt="">
            </a>
            <h1 class="text-center">${sessionScope.user.name}</h1>
        </div>

        <ul class="nav nav-pills nav-stacked">
            <li>
                <a href="${pageContext.request.contextPath}/user/profile"> <i class="fa fa-user"></i> 我的资料</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/user/profile_edit"> <i class="fa fa-edit"></i> 编辑资料</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/action/done"> <i class="fa fa-shopping-cart"></i> 购物记录</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/action/order_history"> <i
                        class="fa fa-sort-numeric-desc"></i> 订单记录</a>
            </li>
        </ul>

    </section>
</aside>
