<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>

<div class="container white-bg" style="padding-top: 15px;">
    <div class="row">
        <div class="col-md-12">
            <c:forEach var="order" items="${goodsList}">
                <div class="col-md-3 ">
                    <div class="goods_item">
                        <a href="/shop/product/${order.gid}">
                            <img class="img-responsive"
                                 src="${pageContext.request.contextPath}${order.headerImg}"
                                 alt="">
                            <div class="goods-title text-center" title="${order.title}">
                                    ${order.title}
                            </div>
                            <div style="padding: 10px;">
                                <button type="button" class="btn btn-danger center-block">
                                    <span class="glyphicon glyphicon-shopping-cart goods-price"></span> ${order.price} 元
                                </button>
                            </div>
                        </a>
                    </div>
                </div>

            </c:forEach>
        </div>
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
                        <a href="?page=1#">&laquo;首页</a>
                    </li>
                    <li class="${1 == currentPage?"disabled":""}">
                        <a href="?page=${currentPage > 1 ? currentPage-1 : 1 }#">&lt; 上一页</a>
                    </li>
                    <li class="disabled"><a href="#"> 第${currentPage}页</a></li>
                    <li class="${maxPage == currentPage?"disabled":""}">
                        <a href="?page=${currentPage != maxPage ? currentPage+1 : maxPage}#">下一页 &gt;</a>
                    </li>
                    <li class="${maxPage == currentPage?"disabled":""}">
                        <a href="?page=${maxPage}#">尾页&raquo;</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>