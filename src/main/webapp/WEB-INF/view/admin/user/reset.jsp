<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<div class="container" style="min-height: 700px">
    <div class="row  clearfix">
        <div class="col-sm-12" style="margin: 100px auto;">
            <div class="col-sm-12 col-md-offset-4 col-md-4">
                <div class="panel panel-success table-view">
                    <div class="panel-heading">
                        <h4 class="text-center">
                            重置用户密码
                        </h4>
                    </div>
                    <div class="panel-body">
                        <form role="form" id="addUser" class="form-horizontal" style="padding: 10px;"
                              action="" method="post">
                            <div class="form-group">
                                <label>用户名: </label>${user.name}
                            </div>
                            <div class="form-group">
                                <label for="inputPwd">新密码</label>
                                <input type="password" required placeholder="用户密码" class="form-control" value=""
                                       name="password"
                                       id="inputPwd"/>
                            </div>
                            <div class="form-group">
                                <label>确认新密码</label>
                                <input type="password" required placeholder="再输入密码进行确认" class="form-control" value=""
                                       id="repwd"/>
                            </div>
                            <div id="errorMsg" class="text-danger"></div>
                            <div class="form-group text-center">
                                <input type="button" id="send" onclick="check();" class="btn btn-success"
                                       value="重置密码">
                                <input type="reset" id="rest" class="btn btn-success"
                                       value="取消">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var inputPwd = $("#inputPwd");
    var repwd = $("#repwd");
    var error_msg = $('#errorMsg');
    var reset = $("#rest");
    /**
     * 检验登录
     */
    function check() {
        var ok = true;
        if (inputPwd.val() !== repwd.val()) {
            error_msg.text('两次输入的密码不相同，请重新确认');
            ok = false;
        }
        if (ok) {
            submit();
        }

    }
    /*提交数据*/
    function submit() {
        error_msg.text('');
        $.post('${pageContext.request.contextPath}/admin/user/reset/${user.id}', {
            password: inputPwd.val()
        }, function (resp) {
            var data = JSON.parse(resp);
            if (data['success']) {
                alert(data['data']);
                reset.click();
            } else {
                error_msg.text(data['data'])
            }
        })
    }

</script>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>