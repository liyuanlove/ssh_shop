<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container" style="min-height: 700px">
    <div class="row  clearfix">
        <div class="col-sm-12 col-lg-12 col-md-12" style="margin: 100px auto;">
            <div class="col-sm-4 col-lg-4 hidden-sm"></div>
            <div class="col-sm-12 col-lg-4 col-md-4">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h4 class="text-center">
                            用户登录
                        </h4>
                    </div>
                    <div class="panel-body">
                        <form role="form" class="form-horizontal" style="padding: 10px;"
                              action="" method="post">
                            <div class="form-group">
                                <label for="inputUserName">用户名</label>
                                <input type="text" required placeholder="用户名" class="form-control" name="username"
                                       id="inputUserName"/>
                            </div>
                            <div class="form-group">
                                <label for="inputPwd">密码</label>
                                <input type="password" required placeholder="请输入你的密码" class="form-control"
                                       name="password"
                                       id="inputPwd"/>
                            </div>
                            <input type="submit" id="send" onclick="check()" class="btn btn-success btn-block btn-lg"
                                   value="登录">
                            <label id="errorMsg" class="text-danger"> ${error_msg}</label>
                        </form>
                    </div>
                    <div class="panel-footer">
                        <a title="点击注册新账号" href="register">注册</a>
                        <a class="pull-right clearfix" title="点击找回密码" href="#">忘记密码？</a>
                    </div>
                </div>
            </div>
            <div class="hidden-sm  col-lg-4 col-md-4"></div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>

<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>