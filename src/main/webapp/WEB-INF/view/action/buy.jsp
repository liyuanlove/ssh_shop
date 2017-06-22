<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <form class="form-inline" action="${pageContext.request.contextPath}/action/order" method="post">
        <div class="form-group">
            商品名称：${goods.title} 价格：${goods.price}￥
            <label>
                <input name="gid" type="hidden" value="${goods.gid}">
                <input name="num" type="number" max="${goods.num}" value="1">
            </label>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-info">提交</button>
        </div>
    </form>
</div>

<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
