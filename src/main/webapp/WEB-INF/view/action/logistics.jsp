<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <aside class="profile-info col-lg-12">
        <section class="panel">
            <div class="panel-body profile-activity">
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
                                <p>你购买的商品已到达。</p>
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
                                <p>你购买的商品已整装待发</p>
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
                                <p>您已成功支付 </p>
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
                                <p>订单生成，请尽快支付</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </aside>
</div>

<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>