<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/_Layout/basic_header_admin.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <section class="panel tasks-widget panel-danger">
                <header class="panel-heading text-center"> 用户列表</header>
                <div class="panel-body">
                    <div class="task-content">
                        <ul class="task-list">

                            <c:forEach items="${usersList}" var="user">
                                <li>
                                    <div class="task-checkbox">
                                        <label>
                                            <input type="checkbox" class="list-child" name="bid"
                                                   value="${user.id}"/>
                                        </label>
                                    </div>
                                    <div class="task-title">
										<span class="task-title-sp"> <a
                                                href="#"
                                                title="点击查看用户详情" target="_blank">
                                                ${user.name}
                                        </a>
                                        </span>
                                        <div class="pull-right hidden-phone">
                                            <a class="btn btn-success btn-xs"
                                               href="${pageContext.request.contextPath}/admin/user/reset/${user.id}"
                                               title="更新用户信息"><i class=" fa fa-edit"></i>
                                            </a>
                                            <a
                                                    class="btn btn-danger btn-xs"
                                                    href="${pageContext.request.contextPath}/admin/user/delete/${user.id}"
                                                    title="删除该用户">
                                                <i class="fa fa-trash-o "></i>
                                            </a>
                                        </div>
                                    </div>
                                </li>

                            </c:forEach>
                        </ul>
                    </div>
                    <div class="add-task-row">
                        <div class="mail-option">
                            <div class="btn-group" id="refresh">
                                <a class="btn mini tooltips"
                                   href="?refresh"
                                   data-original-title="Refresh"> <i class=" fa fa-refresh"></i>刷新列表
                                </a>
                            </div>
                            <div class="panel-info pull-right center-pill">
                                共${usersCount}个用户/共${maxPage}页、当前页<code>&nbsp;${currentPage}&nbsp;</code>
                            </div>
                        </div>
                        <ul class="pagination pull-right">
                            <li class="${1 == currentPage?"disabled":""}">
                                <a href="?page=1#">&laquo;
                                    首页</a></li>
                            <li class="${1 == currentPage?"disabled":""}">
                                <a href="?page=${currentPage > 1 ? currentPage-1 : 1 }#"
                                >&lt; 上一页</a></li>
                            <li class="${maxPage == currentPage?"disabled":""}">
                                <a href="?page=${currentPage != maxPage ? currentPage+1 : maxPage}#">
                                    下一页 &gt;</a></li>
                            <li class="${maxPage == currentPage?"disabled":""}">
                                <a href="?page=${maxPage}#">尾页
                                    &raquo;</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>