<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--用户浏览前端页面顶部导航条--%>
<div class="nav">
    <div class="container">
        <div class="navbar-header">
            <button class="navbar-toggle collapsed btn-link" type="button" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="glyphicon glyphicon-th-list"></span>
            </button>
            <a class="navbar-brand hidden-sm hidden-lg hidden-md" href="${pageContext.request.contextPath}/">首页</a>
        </div>
        <div class="navbar-collapse collapse" role="navigation">
            <ul class="nav navbar-nav">
                <li class="hidden-xs"><a href="${pageContext.request.contextPath}/#">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/shop/#">产品展示</a></li>
                <li><a href="${pageContext.request.contextPath}/about#">关于我们</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <form class="navbar-form navbar-left hidden-sm" role="search"
                      action="${pageContext.request.contextPath}/shop/search/">
                    <div class="form-group">
                        <input type="text" name="keyword" class="form-control" placeholder="输入关键词搜索">
                    </div>
                    <button type="submit" class="btn btn-danger"><span class="glyphicon glyphicon-search"></span>搜索
                    </button>
                </form>
                <c:if test="${sessionScope.user != null}">
                    <li>
                        <a href="${pageContext.request.contextPath}/cart/"><i class="fa fa-shopping-cart"></i> 购物车 </a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                            <span class="glyphicon glyphicon-user"></span>
                            <span class="">${sessionScope.user.name}</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="${pageContext.request.contextPath}/user/">
                                个人主页</a></li>
                            <li><a href="${pageContext.request.contextPath}/user/center">
                                个人中心</a></li>
                            <li>
                                <a href="${pageContext.request.contextPath}/message/">
                                    <span class=""> 消息中心 </span>
                                </a>
                            </li>
                                <%--如果是管理员组成员、显示后台管选项--%>
                            <c:if test="${sessionScope.user.groupId == 1}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/admin/">
                                        <span class=""> 后台管理 </span>
                                    </a>
                                </li>
                            </c:if>
                            <li class="divider hidden-xs"></li>
                            <li><a title="退出登录" href="${pageContext.request.contextPath}/verify/logout"><span
                                    class="glyphicon glyphicon-log-out"></span> 退出</a></li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${sessionScope.user == null}">
                    <li><a title="登录" href="${pageContext.request.contextPath}/verify/login">登录</a></li>
                    <li><a title="注册" href="${pageContext.request.contextPath}/verify/register">注册</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</div>


