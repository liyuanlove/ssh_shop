<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <section class="panel tasks-widget">
                <header class="panel-heading text-center">
                    购物车
                </header>
                <div class="panel-body">
                    <div class="task-content">
                        <ul class="task-list">
                            <c:forEach items="${cart}" var="goods">
                                <li>
                                    <div class="task-checkbox">
                                        <input type="checkbox" class="list-child" name="gid" value="${goods.gid}">
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp">
                                            <a href="${pageContext.request.contextPath}/shop/product/${goods.gid}"
                                               title="点击查看商品详情"
                                               target="_blank">${goods.title}</a>
                                        </span>
                                        <div class="pull-right hidden-phone">
                                            <button class="btn btn-danger btn-xs">
                                                <a href="#delete" title="从购物车移除该商品商品"> <i
                                                        class="fa fa-trash-o "></i></a>
                                            </button>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="add-task-row">
                        <div class="mail-option">
                            <input id="check_all" type="checkbox" class="mail-checkbox mail-group-checkbox">全选
                            <div class="btn-group" id="refresh">
                                <a class="btn mini tooltips" href="cart.html"
                                   data-original-title="Refresh">
                                    <i class=" fa fa-refresh"></i>刷新列表
                                </a>
                            </div>
                            <div class="btn-group" id="buy">
                                <a class="btn mini btn-danger blue" href="#drop" data-toggle="dropdown"
                                   aria-expanded="true">
                                    提交订单
                                </a>
                            </div>
                            <div class="btn-group" id="delete">
                                <a class="btn mini blue" href="#delete" data-toggle="dropdown">
                                    <i class="fa fa-trash-o "></i>删除所选商品
                                </a>
                            </div>
                            <ul class="unstyled inbox-pagination">
                                <li><span>${requestScope["page_now"]}/${requestScope["page_total"]}页</span></li>
                                <li>
                                    <a href="cart.html?page=${requestScope.page_now > 1 ?requestScope.page_now-1 : 1}#"
                                       class="np-btn"> <i class="fa fa-angle-left  pagination-left"></i>上一页</a>
                                </li>
                                <li>
                                    <a href="cart.html?page=${requestScope.page_now < requestScope.page_total?requestScope.page_now+1:requestScope.page_total}#"
                                       class="np-btn">下一页 <i class="fa fa-angle-right pagination-right"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>

<form name="buy_form" action="buy.html?a=buy" method="post">
    <input type="hidden" name="ids">
</form>
<script>
    var check_all = $("#check_all");
    var del = $("#delete");
    var buy = $("#buy");
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
        if (confirm("确定从购物车移除商品？")) {
            $list_checked.each(function () {
                bids.push($(this).attr("value"));
            });
            console.log(bids);
            var del_items = $.post("delete.html?a=del", {ids: bids.toString()});
            $(".task-list > li:has(.list-child:checked)").remove();
            bids = [];
            window.location.reload();
        }
    });
    buy.click(function () {
        var $list_checked = $(".list-child:checked");
        if ($list_checked.size() == 0) {
            console.log("未选择数据");
            return;
        }
        if (confirm("确定提交订单？")) {
            $list_checked.each(function () {
                bids.push($(this).attr("value"));
            });
            console.log(bids);
            window.document.buy_form.ids.value = bids.toString();
            window.document.buy_form.submit();
            console.log(bids.toString());
        }
        bids = [];
    });
</script>

<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>