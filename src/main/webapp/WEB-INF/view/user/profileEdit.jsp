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
                            <label class="col-lg-2 control-label">邮箱</label>
                            <div class="col-lg-6">
                                <input type="text" value="${user.email}" name="email" class="form-control disabled"
                                       placeholder=" 邮箱">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">电话</label>
                            <div class="col-lg-6">
                                <input type="text" value="${user.phone}" name="phone" class="form-control disabled"
                                       placeholder=" 电话">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">性别</label>
                            <div class="col-lg-6">
                                <select name="sex" title="性别">
                                    <option value="0">男</option>
                                    <option value="1">女</option>
                                    <option value="2">其他</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">地址</label>
                            <select name="address" title="地址">
                                <option value="0">常用地址</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-offset-2 col-lg-10">
                                <button type="submit" class="btn btn-success">更新</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </aside>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>