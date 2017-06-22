<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="/WEB-INF/view/_Layout/front_profile_side_menu.jsp" %>
        <aside class="profile-info col-lg-9">
            <section class="panel">
                <div class="panel-heading">
                    个人信息
                </div>
                <div class="panel-body bio-graph-info">
                    <div class="row">
                        <div class="bio-row">
                            <p><span>姓名： </span> ${sessionScope.user.name}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>注册IP: </span> ${sessionScope.user.regIp}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>国家： </span> 中国</p>
                        </div>
                        <div class="bio-row">
                            <jsp:useBean id="regTime" class="java.util.Date"/>
                            <jsp:setProperty name="regTime" property="time"
                                             value="${sessionScope.user.regTime * 1000}"/>
                            <p><span>注册日期：</span> <fmt:formatDate value="${regTime}" pattern="yyyy年MM月dd日 hh:mm:ss"/>
                            </p>
                        </div>
                        <div class="bio-row">
                            <p><span>用户类型： </span> ${sessionScope.user.groupId==1?"管理员":"普通用户"}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>用户状态 </span> ${sessionScope.user.status == 0?"正常":"受限"}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>电子邮箱： </span> ${sessionScope.user.email}</p>
                        </div>
                        <div class="bio-row">
                            <p><span>手机号码： </span> ${sessionScope.user.phone}</p>
                        </div>

                    </div>
                </div>
            </section>
            <section>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="panel">
                            <div class="panel-body">
                                <div class="bio-chart">
                                    <div style="display:inline;width:100px;height:100px;">
                                        <canvas width="100" height="100px"></canvas>
                                        <input class="knob" data-width="100" data-height="100"
                                               data-displayprevious="true" data-thickness=".2" value="35"
                                               data-fgcolor="#e06b7d" data-bgcolor="#e8e8e8"
                                               style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; font-weight: bold; font-style: normal; font-variant: normal; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(224, 107, 125); padding: 0px; -webkit-appearance: none; background: none;">
                                    </div>
                                </div>
                                <div class="bio-desk">
                                    <h4 class="red">Envato Website</h4>
                                    <p>Started : 15 July</p>
                                    <p>Deadline : 15 August</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel">
                            <div class="panel-body">
                                <div class="bio-chart">
                                    <div style="display:inline;width:100px;height:100px;">
                                        <canvas width="100" height="100px"></canvas>
                                        <input class="knob" data-width="100" data-height="100"
                                               data-displayprevious="true" data-thickness=".2" value="63"
                                               data-fgcolor="#4CC5CD" data-bgcolor="#e8e8e8"
                                               style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; font-weight: bold; font-style: normal; font-variant: normal; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(76, 197, 205); padding: 0px; -webkit-appearance: none; background: none;">
                                    </div>
                                </div>
                                <div class="bio-desk">
                                    <h4 class="terques">ThemeForest CMS </h4>
                                    <p>Started : 15 July</p>
                                    <p>Deadline : 15 August</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel">
                            <div class="panel-body">
                                <div class="bio-chart">
                                    <div style="display:inline;width:100px;height:100px;">
                                        <canvas width="100" height="100px"></canvas>
                                        <input class="knob" data-width="100" data-height="100"
                                               data-displayprevious="true" data-thickness=".2" value="75"
                                               data-fgcolor="#96be4b" data-bgcolor="#e8e8e8"
                                               style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; font-weight: bold; font-style: normal; font-variant: normal; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(150, 190, 75); padding: 0px; -webkit-appearance: none; background: none;">
                                    </div>
                                </div>
                                <div class="bio-desk">
                                    <h4 class="green">VectorLab Portfolio</h4>
                                    <p>Started : 15 July</p>
                                    <p>Deadline : 15 August</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="panel">
                            <div class="panel-body">
                                <div class="bio-chart">
                                    <div style="display:inline;width:100px;height:100px;">
                                        <canvas width="100" height="100px"></canvas>
                                        <input class="knob" data-width="100" data-height="100"
                                               data-displayprevious="true" data-thickness=".2" value="50"
                                               data-fgcolor="#cba4db" data-bgcolor="#e8e8e8"
                                               style="width: 54px; height: 33px; position: absolute; vertical-align: middle; margin-top: 33px; margin-left: -77px; border: 0px; font-weight: bold; font-style: normal; font-variant: normal; font-stretch: normal; font-size: 20px; line-height: normal; font-family: Arial; text-align: center; color: rgb(203, 164, 219); padding: 0px; -webkit-appearance: none; background: none;">
                                    </div>
                                </div>
                                <div class="bio-desk">
                                    <h4 class="purple">Adobe Muse Template</h4>
                                    <p>Started : 15 July</p>
                                    <p>Deadline : 15 August</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </aside>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>