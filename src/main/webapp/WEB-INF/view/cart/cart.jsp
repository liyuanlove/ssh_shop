<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-lg-12 ${empty goodsList?"hidden":""}">
            <section class="panel tasks-widget">
                <header class="panel-heading text-center">
                    购物车
                </header>
                <div class="panel-body">
                    <div class="task-content">
                        <ul class="task-list">
                            <c:set var="item_num" value="0"/>
                            <c:forEach items="${goodsList}" var="goods">
                                <li class="cart_item">
                                    <div class="task-checkbox">
                                        <label>
                                            <input type="checkbox" class="list-child" name="gid"
                                                   value="${goods.gid}">${item_num+1}.
                                        </label>
                                    </div>
                                    <div class="task-title">
                                        <span class="task-title-sp">
                                            <a href="${pageContext.request.contextPath}/shop/product/${goods.gid}"
                                               title="点击查看商品详情"
                                               target="_blank">${goods.title}</a>
                                        </span>
                                        <label>
                                            <input type="number" name="num" value="${cart.get(item_num).num}">
                                        </label>
                                        <div class="pull-right hidden-phone">
                                            <button class="btn btn-danger btn-xs">
                                                <a href="#delete" onclick="remove(${goods.gid})" title="从购物车移除该商品商品"> <i
                                                        class="fa fa-trash-o "></i></a>
                                            </button>
                                        </div>
                                    </div>
                                </li>
                                <c:set var="item_num" value="${item_num+1}"/>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="add-task-row">
                        <div class="mail-option">
                            <input id="check_all" type="checkbox" class="mail-checkbox mail-group-checkbox">全选
                            <div class="btn-group" id="refresh">
                                <a class="btn mini tooltips" href="?refresh"
                                   data-original-title="Refresh">
                                    <i class=" fa fa-refresh"></i>刷新
                                </a>
                            </div>
                            <div class="btn-group" id="buy">
                                <a class="btn btn-info" href="#drop" data-toggle="dropdown"
                                   aria-expanded="true">
                                    提交订单
                                </a>
                            </div>
                            <div class="btn-group" id="delete">
                                <a class="btn btn-danger" href="#delete" data-toggle="dropdown">
                                    <i class="fa fa-trash-o "></i>删除所选
                                </a>
                            </div>
                            <div class="btn " id="clear">
                                <a class="btn btn-danger" href="./clear">
                                    <i class="fa fa-trash-o "></i>清空
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <c:if test="${cart == null||empty cart}">
            <div class="col-md-4 col-md-offset-4">
                <span class="glyphicon glyphicon-shopping-cart"></span>
                <p>购物车为空</p>
                <a href="${pageContext.request.contextPath}/shop/">马上去购物</a>
            </div>
        </c:if>
    </div>
</div>

<form name="buy_form" action="${pageContext.request.contextPath}/action/buy/all" method="post">
    <input type="hidden" name="order_data">
</form>
<script>
    var check_all = $("#check_all");
    var del = $("#delete");
    var buy = $("#buy");
    var list = $(".list-child");
    list.change(function () {
        check_all.prop("checked", false);
    });
    //移除商品
    function remove(gid) {
        if (confirm("确定从购物车移除？")) {
            $(this).parent().parent().remove();
            console.log();
            $.get('./remove/' + gid, function (resp) {
                alert(resp);
            });
        } else {
            alert("取消");
        }
    }

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
        if (confirm("确定从购物车移除商品？")) {
            $list_checked.each(function () {
                gids.push($(this).attr("value"));
            });
            console.log(gids);
            var del_items = $.post("/cart/remove/", {ids: gids.toString()});
            $(".task-list > li:has(.list-child:checked)").remove();
            gids = [];
            window.location.reload();
        }
    });
    buy.click(function () {
        var $list_checked = $(".list-child:checked");
        if ($list_checked.size() === 0) {
            console.log("未选择数据");
            return;
        }
        if (confirm("确定提交订单？")) {
            var nums = [];
            $list_checked.each(function () {
                var $now_elem = $(this);
                gids.push(parseInt($now_elem.attr("value")));
                var val = $now_elem.parent().find(".num").val();
                nums.push(val)
            });
            console.log(gids);
            var order_data = {'gids': gids, 'nums': nums};
            window.document.buy_form.order_data.value = JSON.stringify(order_data);
            window.document.buy_form.submit();
            console.log(JSON.stringify(order_data));
        }
        gids = [];
    });
</script>
<link href="${pageContext.request.contextPath}/public/admin/css/tasks.css" rel="stylesheet" type="text/css">
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>