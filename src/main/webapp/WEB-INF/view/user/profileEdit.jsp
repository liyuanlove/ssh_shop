<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <%--侧边栏菜单按钮--%>
        <%@include file="/WEB-INF/view/_Layout/front_profile_side_menu.jsp" %>
        <aside class="profile-info col-lg-9">
            <section class="panel panel-primary">
                <div class="panel-heading text-center">
                    编辑资料
                </div>
                <div class="panel-body bio-graph-info">
                    <h1> 个人信息</h1>
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-lg-2 control-label">关于我</label>
                            <div class="col-lg-10">
                                <textarea title="" placeholder="简述个人信息" class="form-control" cols="30"
                                          rows="5"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">姓名</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="f-title" placeholder=" 请输入您的姓名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">昵称</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="l-title" placeholder=" 请输入您的昵称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">国家/地区</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="c-title" placeholder=" 请输入您的国家">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">出生日期</label>
                            <div class="col-lg-6">
                                <input type="date" class="form-control" id="b-day" placeholder=" 请输入您的出生日期">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">电子邮箱</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="email" placeholder=" 请输入您的电子邮箱">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">手机号码</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="mobile" placeholder=" 请输入您的手机号码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">个人网站/微博</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="url"
                                       placeholder="http://www.example.com ">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <button type="submit" class="btn btn-success">保存</button>
                                <button type="button" class="btn btn-default">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
            <section>
                <div class="panel panel-primary">
                    <div class="panel-heading"> 修改头像</div>
                    <div class="panel-body">
                        <form class="form-horizontal" role="form" action="./modifyHeader.html" method="post"
                              enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="col-lg-2 control-label">上传头像</label>
                                <div class="col-lg-6">
                                    <input type="file" class="file-pos" title="img_header">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <button type="submit" class="btn btn-info">提交</button>
                                    <button type="reset" class="btn btn-default">取消</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </aside>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>