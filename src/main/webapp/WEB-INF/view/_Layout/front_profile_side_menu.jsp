<%--用户信息页侧边菜单--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="profile-nav col-lg-3">
    <section class="panel">
        <div class="userEntity-heading round">
            <a href="#">
                <img src="<%=request.getContextPath()%>/public/images/header.jpg" alt="">
            </a>
            <h1 class="text-center">${sessionScope.user.name}</h1>
        </div>

        <ul class="nav nav-pills nav-stacked">
            <li>
                <a href="profile.html"> <i class="fa fa-user"></i> 我的资料</a>
            </li>
            <li>
                <a href="activity.html"> <i class="fa fa-calendar"></i> 最近活动 <span
                        class="label label-danger pull-right r-activity">9</span></a>
            </li>
            <li>
                <a href="profile_edit.html"> <i class="fa fa-edit"></i> 编辑资料</a>
            </li>
        </ul>

    </section>
</aside>
