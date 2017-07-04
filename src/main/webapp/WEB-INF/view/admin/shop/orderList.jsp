<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/_Layout/basic_header_admin.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-lg-12" style="min-height: 650px;">
            <section class="panel tasks-widget panel-danger">
                <header class="panel-heading text-center"> 订单列表</header>
                <div class="panel-body">
                    <div class="task-content">
                        <ol class="task-list">
                            <c:forEach items="${ordersList}" var="order">
                                <li>
                                    <div class="task-checkbox">

                                    </div>
                                    <div class="task-title">
										<span class="task-title-sp"> <a
                                                data-toggle="modal" data-target="#info_box"
                                                href="#" onclick="show(${order.orderId})"
                                                title="点击查看订单详情">
                                                ${order.info}
                                        </a>
										</span>
                                    </div>
                                </li>

                            </c:forEach>
                        </ol>
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
                                共${orderCount}条订单信息/共${maxPage}页、当前页<code>&nbsp;${currentPage}&nbsp;</code>
                            </div>
                        </div>
                        <div class="row ${ordersList.size() == 0?"hidden":""}">
                            <div class="col-md-12">
                                <nav class="text-center">
                                    <ul class="pagination pull-right">
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
            </section>
        </div>
    </div>
</div>
<div class="modal fade" id="info_box" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    模态框（Modal）标题
                </h4>
            </div>
            <div class="modal-body">
                在这里添加一些文本
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    function show(order_id) {
        $.get('${pageContext.request.contextPath}/admin/shop/order/' + order_id, function (data, status) {
            console.log(data + "\n" + status)
        })
    }
</script>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>