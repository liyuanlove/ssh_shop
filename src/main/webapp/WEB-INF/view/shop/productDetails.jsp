<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <section class="panel">
                <div class="panel-body">
                    <div class="col-md-6">
                        <div class="pro-img-details">
                            <img src="${pageContext.request.contextPath}/public/images/f8.jpg"
                                 alt="图片">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <h4 class="pro-d-title">
                            <a>
                                ${goods.title}
                            </a>
                        </h4>
                        <div class="product_meta">
                            <span class="posted_in"> <strong>分类:</strong> </span>
                            <span class="tagged_as"><strong>标签:</strong> </span>
                        </div>
                        <div class="m-bot15"><strong>价格 : </strong> <span
                                class="pro-price"> ￥${goods.price}</span></div>
                        <div class="form-group">
                            <label>数量: <span class="pro-price">${goods.num}</span></label>
                        </div>
                        <form action="${pageContext.request.contextPath}/user/buy/${goods.gid}" method="post">
                            <input type="hidden" name="num" placeholder="1" value="${goods.num}"
                                   class="form-control">
                            <input type="hidden" name="gid" placeholder="1" value="${goods.gid}"
                                   class="form-control">
                            <a href="${pageContext.request.contextPath}/action/buy/${goods.gid}"
                               class="btn btn-round btn-danger" title="立即购买"
                               type="button"><i
                                    class="fa fa-money"></i>
                                购买
                            </a>
                            <a href="${pageContext.request.contextPath}/cart/add/${goods.gid}"
                               class="btn btn-round btn-danger"
                               title="添加到购物车" type="button"><i
                                    class="fa fa-shopping-cart"></i>
                                添加
                            </a>
                        </form>
                    </div>
                </div>
            </section>
            <div class="container">
                <section class="panel">
                    <header class="panel-heading tab-bg-dark-navy-blue">
                        <ul class="nav nav-tabs ">
                            <li class="active">
                                <a data-toggle="tab" href="#intro" aria-expanded="false">
                                    描述
                                </a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#reviews" aria-expanded="true">
                                    评论
                                </a>
                            </li>

                        </ul>
                    </header>
                    <div class="panel-body">
                        <div class="tab-content tasi-tab">
                            <div id="intro" class="tab-pane active">
                                <h4 class="pro-d-head">商品描述</h4>
                                <div class="container">
                                    <div class="row">
                                        ${goods.intro}
                                    </div>
                                </div>
                            </div>
                            <div id="reviews" class="tab-pane">
                                <article class="media">
                                    <a class="pull-left thumb p-thumb">
                                        <img src="${pageContext.request.contextPath}/static/site/img/avatar-mini.jpg">
                                    </a>
                                    <div class="media-body">
                                        <a href="#" class="cmt-head">Lorem ipsum dolor sit amet, consectetur adipiscing
                                            elit.</a>
                                        <p><i class="fa fa-time"></i> 1 hours ago</p>
                                    </div>
                                </article>
                                <article class="media">
                                    <a class="pull-left thumb p-thumb">
                                        <img src="${pageContext.request.contextPath}/static/site/img/avatar-mini2.jpg">
                                    </a>
                                    <div class="media-body">
                                        <a href="#" class="cmt-head">Nulla vel metus scelerisque ante sollicitudin
                                            commodo</a>
                                        <p><i class="fa fa-time"></i> 23 mins ago</p>
                                    </div>
                                </article>
                                <article class="media">
                                    <a class="pull-left thumb p-thumb">
                                        <img src="${pageContext.request.contextPath}/public/images/p1.jpg">
                                    </a>
                                    <div class="media-body">
                                        <a href="#" class="cmt-head">Donec lacinia congue felis in faucibus. </a>
                                        <p><i class="fa fa-time"></i> 15 mins ago</p>
                                    </div>
                                </article>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>