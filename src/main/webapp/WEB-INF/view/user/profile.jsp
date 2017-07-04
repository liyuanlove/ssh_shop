<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="/WEB-INF/view/_Layout/front_profile_side_menu.jsp" %>
        <aside class="profile-info col-lg-9">
            <section class="panel">
                <div class="panel-heading">
                    个人信息
                </div>
                <div class="panel-body bio-graph-info">
                    <div class="row">
                        <div class="bio-row">
                            <p><span>姓名： </span> ${sessionScope.user.name}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>注册IP: </span> ${sessionScope.user.regIp}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>国家： </span> 中国</p>
                        </div>
                        <div class="bio-row">
                            <jsp:useBean id="regTime" class="java.util.Date"/>
                            <jsp:setProperty name="regTime" property="time"
                                             value="${sessionScope.user.regTime * 1000}"/>
                            <p><span>注册日期：</span> <fmt:formatDate value="${regTime}" pattern="yyyy年MM月dd日 hh:mm:ss"/>
                            </p>
                        </div>
                        <div class="bio-row">
                            <p><span>用户类型： </span> ${sessionScope.user.groupId==1?"管理员":"普通用户"}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>用户状态 </span> ${sessionScope.user.status == 0?"正常":"受限"}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>电子邮箱： </span> ${sessionScope.user.email}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>手机号码： </span> ${sessionScope.user.phone}</p>
                        </div>

                    </div>
                </div>
            </section>
        </aside>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>