<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="row product-list">
                <c:forEach var="goods" items="${goodsList}">
                    <div class="col-md-3 effect-apollo">
                        <section class="panel">
                            <div class="pro-img-box">
                                <a href="${pageContext.request.contextPath}/shop/product/${goods.gid}">
                                    <img src="${pageContext.request.contextPath}${goods.headerImg}"
                                         alt="">
                                </a>
                                <a class="adtocart">
                                    <i class="fa fa-shopping-cart"></i>
                                </a>
                            </div>

                            <div class="panel-body text-center">
                                <h4>
                                    <a href="${pageContext.request.contextPath}/shop/product/${goods.gid}"
                                       class="pro-title">
                                            ${goods.title}
                                    </a>
                                </h4>
                                <p class="price">售价:￥${goods.price}
                                </p>
                            </div>
                        </section>
                    </div>
                </c:forEach>
                <c:if test="${goodsList.size() == 0}">
                    <div class="panel">
                        <div class="panel-heading text-center">未获取到数据...</div>
                        <div class="panel-body">暂时无法查询出商品信息！</div>
                    </div>
                </c:if>
            </div>
            <div class="row ${goodsList.size() == 0?"hidden":""}">
                <div class="col-md-12">
                    <nav class="text-center">
                        <ul class="pagination">
                            <li class="${1 == currentPage?"disabled":""}">
                                <a href="?page=1#">&laquo;
                                    首页</a></li>
                            <li class="${1 == currentPage?"disabled":""}">
                                <a href="?page=${currentPage > 1 ? currentPage-1 : 1 }#"
                                >&lt; 上一页</a></li>
                            <li class="${maxPage == currentPage?"disabled":""}">
                                <a href="?page=${currentPage != maxPage ? currentPage+1 : maxPage}#"
                                >
                                    下一页 &gt;</a></li>
                            <li class="${maxPage == currentPage?"disabled":""}">
                                <a href="?page=${maxPage}#">尾页
                                    &raquo;</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>