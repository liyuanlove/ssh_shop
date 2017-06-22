<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/WEB-INF/view/_Layout/basic_header_admin.jsp" %>
<section id="container">
    <!--header start-->
    <header class="header white-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="打开/关闭侧边栏"></div>
        </div>
        <!--logo start-->
        <a href="#" class="logo"><span>系统管理后台</span></a>
        <!--logo end-->
        <div class="nav notify-row" id="top_menu">
            <!--  notification start -->
            <ul class="nav top-menu">
                <!-- settings start -->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-tasks"></i> 服务器
                    </a>
                    <ul class="dropdown-menu extended tasks-bar">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">系统信息</p>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <div class="desc">已使用存储空间</div>
                                    <div class="percent"><span
                                            class="glyphicon glyphicon-hdd"></span>
                                        <fmt:formatNumber value="${freeSpace*100/totalSpace}" type="percent"
                                                          pattern="00.00"/>%
                                    </div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
                                         aria-valuemin="0" aria-valuemax="100"
                                         style="width: ${freeSpace*100/totalSpace}%">
                                        <span class="sr-only">存储空间已使用<fmt:formatNumber
                                                value="${freeSpace*100/totalSpace}" type="percent" pattern="00.00"/>%
                                        </span>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <div class="task-info">
                                    <div class="desc">数据库</div>
                                    <div class="percent"><span class="fa fa-cloud"></span> 60%</div>
                                </div>
                                <div class="progress progress-striped">
                                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        <span class="sr-only">60% Complete (warning)</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- settings end -->
                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <i class="fa fa-user"></i> 管理员
                    </a>
                    <ul class="dropdown-menu extended tasks-bar">
                        <div class="notify-arrow notify-arrow-green"></div>
                        <li>
                            <p class="green">管理员：${sessionScope.user.name}</p>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/verify/logout"><span
                                    class="glyphicon glyphicon-log-out"></span> 退出登录</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!--  notification end -->
        </div>
    </header>
    <!--header end-->
    <!--sidebar start-->
    <aside>
        <div id="sidebar" class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
                <%--资讯管理--%>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-dashboard"></i>
                        <span>控制面板</span>
                    </a>
                    <ul class="sub">
                        <li><a href="dashboard">控制台</a></li>
                    </ul>
                </li>
                <%--用户管理--%>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-users"></i>
                        <span>用户管理</span>
                    </a>
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath}/admin/user/list">用户列表</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/user/add">添加用户</a></li>
                    </ul>
                </li>
                <%--商店管理--%>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-shopping-cart"></i>
                        <span>商城管理</span>
                    </a>
                    <ul class="sub">
                        <li><a href="${pageContext.request.contextPath}/admin/shop/productsList">商品列表</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/shop/add">上架商品</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/shop/ordersList">订单列表</a></li>
                    </ul>
                </li>
                <%--关于--%>
                <li class="sub-menu">
                    <a href="javascript:;">
                        <i class="fa fa-book"></i>
                        <span>关于</span>
                    </a>
                    <ul class="sub">
                        <li><a>关于该系统</a></li>
                    </ul>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>
    <!--sidebar end-->
    <!--main content start-->
    <section id="main-content">
        <section class="wrapper ">
            <iframe src="${pageContext.request.contextPath}/admin/dashboard" width="100%" id="main_page"
                    frameborder="0">
            </iframe>
        </section>
    </section>
    <!--main content end-->
</section>


<script src="<%=request.getContextPath() %>/public/js/owl.carousel.js"></script>
<script src="<%=request.getContextPath() %>/public/js/jquery.dcjqaccordion.2.7.js"></script>
<script src="<%=request.getContextPath() %>/public/js/jquery.nicescroll.js"></script>
<script src="<%=request.getContextPath() %>/public/js/jquery.customSelect.min.js"></script>
<script src="<%=request.getContextPath() %>/public/js/jquery.scrollTo.min.js"></script>
<script src="<%=request.getContextPath() %>/public/js/jquery.sparkline.js"></script>
<script src="<%=request.getContextPath() %>/public/js/respond.min.js"></script>
<script src="<%=request.getContextPath() %>/public/js/slidebars.min.js"></script>
<script src="<%=request.getContextPath() %>/public/js/common-scripts.js"></script>
<script>
    //owl carousel
    var userAgent = navigator.userAgent.toLowerCase();
    // Figure out what browser is being used
    jQuery.browser = {
        version: (userAgent.match(/.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/) || [])[1],
        safari: /webkit/.test(userAgent),
        opera: /opera/.test(userAgent),
        msie: /msie/.test(userAgent) && !/opera/.test(userAgent),
        mozilla: /mozilla/.test(userAgent) && !/(compatible|webkit)/.test(userAgent)
    };
    var main_page = $("#main_page");
    $(document).ready(function () {
        $("#owl-demo").owlCarousel({
            navigation: true,
            slideSpeed: 200,
            paginationSpeed: 300,
            singleItem: true,
            autoPlay: true
        });
        adapter();
    });


    /*内容自适应屏幕高度*/
    function adapter() {
        var h = $("#sidebar").height() - 100;
        main_page.height(h);
    }


    //custom select box

    $(function () {
        $('select.styled').customSelect();
    });
    /*屏幕缩放事件*/
    $(window).on("resize", adapter());

    /*侧边栏按钮点击事件*/
    $(function () {
        $("#sidebar").find("> ul > li > ul.sub > li > a").click(function () {
            $("#sidebar").find("> ul > li > ul.sub > li.active").removeClass("active");
            main_page.attr("src", this.href);
            this.parentElement.setAttribute("class", "active");
            adapter();
            return false;
        });
    });

</script>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
