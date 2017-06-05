<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="zh_CN">
<head>
    <title>${requestScope["html_title"]}</title>
    <%@include file="/WEB-INF/view/_Layout/basic_metas.jsp" %>
    <%--导入前端框架样式文件--%>
    <%@include file="/WEB-INF/view/_Layout/basic_style.jsp" %>
    <link href="<%=request.getContextPath()%>/static/site/css/tasks.css"
          rel="stylesheet">
    <%--IE9的HTML5支持--%>
    <%@include file="/WEB-INF/view/_Layout/basic_support_js.jsp" %>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <section class="panel panel-primary tasks-widget">
                <header class="panel-heading text-center"> 订单列表</header>
                <div class="panel-body">
                    <div class="task-content">
                        <ul class="task-list">
                            <%
                                List<OrderBean> orderList = (List<OrderBean>) request.getAttribute("orderlist");
                                if (orderList != null) {
                                    for (OrderBean order : orderList) {
                            %>
                            <li>
                                <div class="task-title">
										<span class="task-title-sp"> <a title="订单描述"
                                                                        target="_blank"><%=order.getDesc()%></a>
										</span>
                                    <div class="pull-right hidden-phone">
                                        订单所属用户ID：<%=order.getUid()%> &nbsp;&nbsp;&nbsp;订单完成时间<span
                                            class="bage"><%=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(order.getPostTime())%></span>
                                    </div>
                                </div>
                            </li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <div class="add-task-row">
                        <div class="mail-option">
                            <input id="check_all" type="checkbox"
                                   class="mail-checkbox mail-group-checkbox">全选
                            <div class="btn-group" id="refresh">
                                <a class="btn mini tooltips" href="order.html"
                                   data-original-title="Refresh"> <i class=" fa fa-refresh"></i>刷新列表
                                </a>
                            </div>
                            <ul class="unstyled inbox-pagination">
                                <li><span>${requestScope.page_now}/${requestScope.page_total}页</span></li>
                                <li><a
                                        href="order.html?page=${requestScope.page_now > 1 ?requestScope.page_now-1: 1 }#"
                                        class="np-btn"> <i
                                        class="fa fa-angle-left  pagination-left"></i>上一页
                                </a></li>
                                <li><a
                                        href="order.html?page=${requestScope.page_now < requestScope.page_total?requestScope.page_now+1:requestScope.page_total}"
                                        class="np-btn">下一页 <i
                                        class="fa fa-angle-right pagination-right"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/basic_bottom_js.jsp" %>
<script>
    var check_all = $("#check_all");
    var del = $("#delete");
    var drop = $("#drop");
    var list = $(".list-child");
    list.change(function () {
        check_all.prop("checked", false);
    });
    var bids = [];
    //全选取消全选事件
    check_all.click(function () {
        if (check_all.prop("checked") == true) {
            console.log("选择所有");
            list.prop("checked", true)
        } else {
            console.log("取消所有");
            list.prop("checked", false)
        }
    });
    del.click(function () {
        var $list_checked = $(".list-child:checked");
        if ($list_checked.size() == 0) {
            console.log("未选择数据");
            return;
        }
        if (confirm("确定删除？删除后将不能恢复，请谨慎操作！")) {
            $list_checked.each(function () {
                bids.push($(this).attr("value"));
            });
            console.log(bids);
            var del_items = $.post("./delete.html?a=del", {
                ids: bids.toString()
            });
            $(".task-list > li:has(.list-child:checked)").remove();
            bids = [];
            window.location.reload();
        }
    });
    drop.click(function () {
        var $list_checked = $(".list-child:checked");
        if ($list_checked.size() == 0) {
            console.log("未选择数据");
            return;
        }
        if (confirm("确定下架所选商品？")) {
            $list_checked.each(function () {
                bids.push($(this).attr("value"));
            });
            console.log(bids);
            var del_items = $.post("./drop.html?a=drop", {
                ids: bids.toString()
            });
        }
        bids = [];
    });
</script>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>