<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/_Layout/basic_header_admin.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <section class="panel tasks-widget panel-danger">
                <header class="panel-heading text-center"> 所有商品商品列表</header>
                <div class="panel-body">
                    <div class="task-content">
                        <ul class="task-list">
                            <c:forEach items="${goodsList}" var="order">
                                <li>
                                    <div class="task-checkbox">
                                        <label>
                                            <input type="checkbox" class="list-child" name="bid"
                                                   value="${order.gid}"/>
                                        </label>
                                    </div>
                                    <div class="task-title">
										<span class="task-title-sp"> <a
                                                href="${pageContext.request.contextPath}/shop/product/${order.gid}"
                                                title="点击查看商品详情" target="_blank">
                                                ${order.title}
                                        </a>
										</span>
                                        <div class="pull-right hidden-phone">
                                            <a class="btn btn-info btn-xs"
                                               href="${pageContext.request.contextPath}/admin/shop/edit/${order.gid}"
                                               title="修改商品信息"><i class=" fa fa-edit"></i>
                                            </a>
                                            <c:if test="${order.status != -1}">
                                                <a class="btn btn-success btn-xs"
                                                   href="${pageContext.request.contextPath}/admin/shop/drop/${order.gid}"
                                                   title="下架该商品"><i class=" fa fa-download"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${order.status == -1}">
                                                <a class="btn btn-default btn-xs"
                                                   href="${pageContext.request.contextPath}/admin/shop/up/${order.gid}"
                                                   title="上架该商品"><i class=" fa fa-upload"></i>
                                                </a>
                                            </c:if>
                                            <a
                                                    class="btn btn-danger btn-xs"
                                                    href="${pageContext.request.contextPath}/admin/shop/delete/${order.gid}"
                                                    title="删除该商品">
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
                            <input id="check_all" type="checkbox"
                                   class="mail-checkbox mail-group-checkbox"/>全选
                            <div class="btn-group" id="refresh">
                                <a class="btn mini tooltips"
                                   href="${pageContext.request.contextPath}/admin/shop/productsList"
                                   data-original-title="Refresh"> <i class=" fa fa-refresh"></i>刷新列表
                                </a>
                            </div>
                            <div class="btn-group" id="drop">
                                <a class="btn mini blue" href="#drop" data-toggle="dropdown"
                                   aria-expanded="true"> <i class=" fa fa-download"></i>下架所选商品
                                </a>
                            </div>
                            <div class="btn-group" id="up">
                                <a class="btn mini blue" href="#drop" data-toggle="dropdown"
                                   aria-expanded="true"> <i class=" fa fa-upload"></i>上架所选商品
                                </a>
                            </div>
                            <div class="btn-group" id="delete">
                                <a class="btn mini blue" href="#delete" data-toggle="dropdown">
                                    <i class="fa fa-trash-o "></i>删除所选商品
                                </a>
                            </div>
                            <div class="panel-info pull-right center-pill">
                                共${goodsCount}条商品信息/共${maxPage}页、当前页<code>&nbsp;${currentPage}&nbsp;</code>
                            </div>
                        </div>
                        <div class="row ${goodsList.size() == 0?"hidden":""}">
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
<script>
    var check_all = $("#check_all");
    var del = $("#delete");
    var drop = $("#drop");
    var up = $("#up");
    var list = $(".list-child");
    list.change(function () {
        check_all.prop("checked", false);
    });
    var gids = [];
    //全选取消全选事件
    check_all.click(function () {
        if (check_all.prop("checked") === true) {
            console.log("选择所有");
            list.prop("checked", true)
        } else {
            console.log("取消所有");
            list.prop("checked", false)
        }
    });
    del.click(function () {
        var $list_checked = $(".list-child:checked");
        if ($list_checked.size() === 0) {
            console.log("未选择数据");
            return;
        }
        if (confirm("确定删除？删除后将不能恢复，请谨慎操作！")) {
            $list_checked.each(function () {
                gids.push($(this).attr("value"));
            });
            console.log(gids);
            $.post("${pageContext.request.contextPath}/admin/shop/deleteAll", {
                ids: gids.toString()
            }, function () {
                window.location.reload();
            });
            gids = [];
        }
    });
    drop.click(function () {
        var $list_checked = $(".list-child:checked");
        if ($list_checked.size() === 0) {
            console.log("未选择数据");
            return;
        }
        if (confirm("确定下架所选商品？")) {
            $list_checked.each(function () {
                gids.push($(this).attr("value"));
            });
            console.log(gids);
            $.post("${pageContext.request.contextPath}/admin/shop/dropAll", {
                ids: gids.toString()
            }, function () {
                window.location.reload();
            });
        }
        gids = [];
    });

    up.click(function () {
        var $list_checked = $(".list-child:checked");
        if ($list_checked.size() === 0) {
            console.log("未选择数据");
            return;
        }
        if (confirm("确定上架所选商品？")) {
            $list_checked.each(function () {
                gids.push($(this).attr("value"));
            });
            console.log(gids);
            $.post("${pageContext.request.contextPath}/admin/shop/upAll", {
                ids: gids.toString()
            }, function () {
                window.location.reload();
            });
        }
        gids = [];
    });
</script>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>