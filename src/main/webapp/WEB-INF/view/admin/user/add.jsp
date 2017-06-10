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
                            添加新用户
                        </h4>
                    </div>
                    <div class="panel-body">
                        <form role="form" class="form-horizontal" style="padding: 10px;"
                              action="" method="post">
                            <div class="form-group">
                                <label for="inputUserName">用户名</label>
                                <input type="text" required class="form-control"
                                       value="" name="username" id="inputUserName"/>
                            </div>
                            <div class="form-group">
                                <label for="inputPwd">密码</label>
                                <input type="password" required placeholder="用户密码" class="form-control" value=""
                                       name="password"
                                       id="inputPwd"/>
                            </div>
                            <div class="form-group">
                                <label>确认密码</label>
                                <input type="password" required placeholder="再输入密码进行确认" class="form-control" value=""
                                       name="repwd"/>
                            </div>
                            <div class="form-group text-center">
                                <input type="submit" id="send" onclick="check();" class="btn btn-success"
                                       value="添加">
                                <input type="reset" id="rest" onclick="check();" class="btn btn-success"
                                       value="重置">
                            </div>
                            <div id="errorMsg" class="text-danger"> ${error_msg}</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /**
     * 检验登录
     */
    function check() {
        var error_msg = $('#errorMsg');
        var userName = $('#inputUserName');
        if (userName.val().length <= 3) {
            console.log('用户名长度不符');
            alert('nnn');
            error_msg.textContent = '用户名长度不应小于3';
        }
        return false;
    }
</script>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>