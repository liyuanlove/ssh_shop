<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="row">
        <%@include file="/WEB-INF/view/_Layout/front_profile_side_menu.jsp" %>
        <aside class="profile-info col-lg-9">
            <section class="panel">
                <div class="panel-body profile-activity">
                    <h5 class="pull-right"> 2013年8月12日 </h5>
                    <div class="activity terques">
                                  <span>
                                      <i class="fa fa-shopping-cart"></i>
                                  </span>
                        <div class="activity-desk">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="arrow"></div>
                                    <i class=" fa fa-time"></i>
                                    <h4>10:45 </h4>
                                    <p>纬向办公室的设置和文具购买新设备。</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="activity alt purple">
                                  <span>
                                      <i class="fa fa-rocket"></i>
                                  </span>
                        <div class="activity-desk">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="arrow-alt"></div>
                                    <i class=" fa fa-time"></i>
                                    <h4>12:30 </h4>
                                    <p>Lorem存有悲坐阿梅德consiquest DIO</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="activity blue">
                                  <span>
                                      <i class="fa fa-bullhorn"></i>
                                  </span>
                        <div class="activity-desk">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="arrow"></div>
                                    <i class=" fa fa-time"></i>
                                    <h4>10:45 </h4>
                                    <p>请注意，您会考虑哪个位置，或两者兼而有之。报告的副总裁，遵守和企业社会责任，你将负责管理.. </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="activity alt green">
                                  <span>
                                      <i class="fa fa-beer"></i>
                                  </span>
                        <div class="activity-desk">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="arrow-alt"></div>
                                    <i class=" fa fa-time"></i>
                                    <h4>12:30 </h4>
                                    <p>请注意，您会考虑哪个位置，或两者兼而有之。</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
            <section class="panel">
                <header class="panel-heading summary-head">
                    <h4>每日摘要</h4>
                    <p>2013年8月12日</p>
                </header>
                <div class="panel-body">
                    <ul class="summary-list">
                        <li>
                            <a href="javascript:;">
                                <i class=" fa fa-shopping-cart text-primary"></i>
                                购买
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-envelope text-info"></i>
                                电子邮件
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-picture-o text-muted"></i>
                                上传照片
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-tags text-success"></i>
                                销售
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <i class="fa fa-microphone text-danger"></i>
                                音频
                            </a>
                        </li>
                    </ul>
                </div>
            </section>
            <section class="panel">
                <div class="panel-body profile-activity">
                    <h5 class="pull-right">2013年8月11日</h5>
                    <div class="activity terques">
                                  <span>
                                      <i class="fa fa-picture-o"></i>
                                  </span>
                        <div class="activity-desk">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="arrow"></div>
                                    <i class=" fa fa-time"></i>
                                    <h4>10:45 </h4>
                                    <p>当前功能的产品增加了新照片</p>
                                    <div class="album">
                                        <a href="#">
                                            <img src="<%=request.getContextPath()%>/static/site/img/pro-ac-1.png"
                                                 alt="">
                                        </a>
                                        <a href="#">
                                            <img src="<%=request.getContextPath()%>/static/site/img/pro-ac-2.png"
                                                 alt="">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="activity alt purple">
                                  <span>
                                      <i class="fa fa-rocket"></i>
                                  </span>
                        <div class="activity-desk">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="arrow-alt"></div>
                                    <i class=" fa fa-time"></i>
                                    <h4>12:30 </h4>
                                    <p>人声录音。请注意，您会考虑哪个位置，或两者兼而有之</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <div class="text-center">
                <a class="btn btn-danger" href="javascript:;">加载内容</a>
            </div>
        </aside>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>