<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="/WEB-INF/view/_Layout/front_profile_side_menu.jsp" %>
        <aside class="profile-info col-lg-9">
            <section class="panel" style="min-height: 650px;">
                <h3 class="header-panel" style="padding: 15px;">
                    购物记录
                </h3>
                <%
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-DD HH:mm:ss");
                %>
                <table class="table table-inbox table-hover">

                    <tbody>
                    <c:forEach items="${orderList}" var="order">
                        <tr class="">
                            <td class="view-message">
                                <a title="查看订单物流详细信息"
                                   href="${pageContext.request.contextPath}/action/logistics/12">${order.info}</a>
                            </td>
                            <td class="view-message text-right">生成时间</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </section>
        </aside>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>