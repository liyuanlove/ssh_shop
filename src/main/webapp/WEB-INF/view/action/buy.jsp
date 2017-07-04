<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container white-bg">
    <div class="panel">
        <div class="panel-title">
            <h4>购买商品</h4>
        </div>
        <div class="col-md-4">
            <img src="${pageContext.request.contextPath}${goods.headerImg}" class="img-responsive">
        </div>
        <div class="col-md-8">
            <form class="form-inline" action="${pageContext.request.contextPath}/action/order" method="post">
                <div class="form-group">
                    <p class="price">商品名称：${goods.title}</p>
                    <p>价格：${goods.price}</p>
                    <p>
                        <label>购买数量
                            <input name="gid" type="hidden" value="${goods.gid}">
                            <input name="num" type="number" max="${goods.num}" value="1">
                        </label>
                    </p>
                </div>
                <div>
                    <button type="submit" class="btn btn-info">提交</button>
                </div>
            </form>
        </div>
    </div>

</div>

<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
