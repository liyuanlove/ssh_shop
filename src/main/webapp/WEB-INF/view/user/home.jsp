<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container" style="padding-top: 5px;">
    <div class="row">
        <div class="col-md-9">
            <section class="panel">
                <div class="cover-photo">
                    <div class="fb-timeline-img">
                        <img src="<%=request.getContextPath()%>/public/img/fb-img.jpg" alt="">
                    </div>

                </div>
                <div class="panel-body">
                    <div class="profile-thumb">
                        <img src="<%=request.getContextPath()%>${sessionScope.user.img}"
                             alt="">
                    </div>
                    <div class="fb-title">
                        <h2><a href="#">${sessionScope.user.name}</a></h2>
                        <a href="#" class="fb-user-mail">${sessionScope.user.id}</a>
                    </div>
                </div>
            </section>

            <section class="panel profile-info">
                <form>
                    <textarea class="form-control input-lg p-text-area" rows="2"
                              placeholder="Whats in your mind today?"></textarea>
                </form>
                <footer class="panel-footer">
                    <button class="btn btn-danger pull-right">发表</button>
                    <ul class="nav nav-pills">
                        <li>
                            <a href="#"><i class="fa fa-map-marker"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-camera"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class=" fa fa-film"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-microphone"></i></a>
                        </li>
                    </ul>
                </footer>
            </section>
            <section class="panel">
                <div class="panel-body">
                    <div class="fb-user-thumb">
                        <img src="<%=request.getContextPath()%>/public/img/pro-ac-1.png" alt="">
                    </div>
                    <div class="fb-user-details">
                        <h3><a href="#" class="#">玛格丽塔叶琳娜</a></h3>
                        <p>美国阿拉斯加近6分钟前</p>
                    </div>
                    <div class="clearfix"></div>
                    <p class="fb-user-status">约翰是世界著名的专业摄影师。用客户的前瞻思维创造美丽、诚实、神奇的事物，带来积极的成果。
                        约翰是世界著名的专业摄影师。用客户的前瞻思维创造美丽、诚实、神奇的事物，带来积极的成果。
                    </p>
                    <div class="fb-status-container fb-border">
                        <div class="fb-time-action">
                            <a href="#" title="Like this">类似</a>
                            <span>-</span>
                            <a href="#" title="Leave a comment">评论</a>
                            <span>-</span>
                            <a href="#" title="Send this to friend or post it on your time line">分享</a>
                        </div>
                    </div>


                    <div class="fb-status-container fb-border fb-gray-bg">
                        <div class="fb-time-action like-info">
                            <a href="#">Jhon</a>
                            <a href="#">Danieal Kalion</a>
                            <span>-</span>
                            <a href="#">更多</a>
                            <span>赞</span>
                        </div>

                        <ul class="fb-comments">
                            <li>
                                <a href="#" class="cmt-thumb">
                                    <img src="<%=request.getContextPath()%>/public/img/mail-avatar.jpg" alt="">
                                </a>
                                <div class="cmt-details">
                                    <a href="#">由于Jhon</a>
                                    <span> 是世界著名的专业摄影师。以前瞻思维客户创造优美，</span>
                                    <p>40 分钟前 - <a href="#" class="like-link">赞</a></p>
                                </div>
                            </li>
                            <li>
                                <a href="#" class="cmt-thumb">
                                    <img src="<%=request.getContextPath()%>/public/img/follower-avatar.jpg"
                                         alt="">
                                </a>
                                <div class="cmt-details">
                                    <a href="#">由于</a>
                                    <span>Jhone 是世界著名的专业摄影师。以前瞻思维客户创造优美，</span>
                                    <p>34分钟前 - <a href="#" class="like-link">赞</a></p>
                                </div>
                            </li>

                            <li>
                                <a href="#" class="cmt-thumb">
                                    <img src="<%=request.getContextPath()%>/public/img/mail-avatar.jpg" alt="">
                                </a>
                                <div class="cmt-details">
                                    <a href="#">由于Jhon</a>
                                    <span> 是世界著名的专业摄影师   </span>
                                    <p>15分钟前 - <a href="#" class="like-link">赞</a></p>
                                </div>
                            </li>
                            <li>
                                <a href="#" class="cmt-thumb">
                                    <img src="<%=request.getContextPath()%>/public/img/follower-avatar.jpg"
                                         alt="">
                                </a>
                                <div class="cmt-details">
                                    <a href="#">Tawseef</a>
                                    <span> 思考客户创造美好的世界著名专业摄影师</span>
                                    <p>2 分钟前 - <a href="#" class="like-link">赞</a></p>
                                </div>
                            </li>
                            <li>
                                <a href="#" class="cmt-thumb">
                                    <img src="<%=request.getContextPath()%>/public/img/follower-avatar.jpg"
                                         alt="">
                                </a>
                                <div class="cmt-form">
                                    <textarea class="form-control" placeholder="评论..." title=""></textarea>
                                </div>
                            </li>
                        </ul>

                        <div class="clearfix"></div>

                    </div>

                </div>
            </section>

            <section class="panel">
                <div class="panel-body">
                    <div class="fb-user-thumb">
                        <img alt="" src="<%=request.getContextPath()%>/public/img/pro-ac-2.png">
                    </div>
                    <div class="fb-user-details">
                        <h3><a class="#" href="#">Jasica Rosario</a></h3>
                        <p>美国阿拉斯加近6分钟前</p>
                    </div>
                    <div class="clearfix"></div>
                    <p class="fb-user-status">约翰是世界著名的专业摄影师。以前瞻性思维的客户创造美丽，诚实和惊人的事情，使积极的成果。
                        约翰是世界著名的专业摄影师。以前瞻性思维的客户创造美丽，诚实和惊人的事情，使积极的成果。
                    </p>
                    <div class="fb-time-action">
                        <a href="#" title="Like this">类似</a>
                        <span>-</span>
                        <a href="#" title="Leave a comment">评论</a>
                        <span>-</span>
                        <a href="#" title="Send this to friend or post it on your time line">分享</a>
                    </div>


                    <div class="fb-status-container fb-border fb-gray-bg">
                        <div class="fb-time-action like-info">
                            <a href="#">Jhon Due,</a>
                            <a href="#">Danieal Kalion</a>
                            <span>-</span>
                            <a href="#">更多</a>
                            <span>详细</span>
                        </div>

                        <ul class="fb-comments">
                            <li>
                                <a class="cmt-thumb" href="#">
                                    <img alt="" src="<%=request.getContextPath()%>/public/img/mail-avatar.jpg">
                                </a>
                                <div class="cmt-details">
                                    <a href="#">由于Jhon</a>
                                    <span> 是世界著名的专业摄影师。以前瞻思维客户创造优美， </span>
                                    <p>23 分钟前 - <a class="like-link" href="#" title="Like this">Like</a></p>
                                </div>
                            </li>
                            <li>
                                <a class="cmt-thumb" href="#">
                                    <img alt=""
                                         src="<%=request.getContextPath()%>/public/img/follower-avatar.jpg">
                                </a>
                                <div class="cmt-details">
                                    <a href="#">Tawseef</a>
                                    <span>是世界著名的专业摄影师。以前瞻思维客户创造优美， </span>
                                    <p>45 分钟前 - <a class="like-link" href="#" title="Like this">Like</a></p>
                                </div>
                            </li>


                            <li>
                                <a class="cmt-thumb" href="#">
                                    <img alt=""
                                         src="<%=request.getContextPath()%>/public/img/follower-avatar.jpg">
                                </a>
                                <div class="cmt-form">
                                    <textarea title="" placeholder="评论..." class="form-control"></textarea>
                                </div>
                            </li>
                        </ul>

                        <div class="clearfix"></div>

                    </div>

                </div>
            </section>

        </div>
        <div class="col-md-3 white-bg">
            <div class="fb-timeliner">
                <h2 class="recent-highlight">最近</h2>
                <ul>
                    <li class="active"><a href="#">十二月</a></li>
                    <li><a href="#">十一月</a></li>
                    <li><a href="#">十月</a></li>
                    <li><a href="#">九月</a></li>
                    <li><a href="#">八月</a></li>
                    <li><a href="#">七月</a></li>
                    <li><a href="#">六月</a></li>
                    <li><a href="#">五月</a></li>
                    <li><a href="#">四月</a></li>
                    <li><a href="#">三月</a></li>
                    <li><a href="#">二月</a></li>
                    <li><a href="#">一月</a></li>
                </ul>
            </div>
            <div class="fb-timeliner">
                <h2>2012</h2>
                <ul>
                    <li><a href="#">八月</a></li>
                    <li><a href="#">七月</a></li>
                    <li><a href="#">六月</a></li>
                    <li><a href="#">五月</a></li>
                    <li><a href="#">四月</a></li>
                    <li><a href="#">三月</a></li>
                    <li><a href="#">二月</a></li>
                    <li><a href="#">一月</a></li>
                </ul>
            </div>
            <div class="fb-timeliner">
                <h2>2011</h2>
                <ul>
                    <li><a href="#">五月</a></li>
                    <li><a href="#">四月</a></li>
                    <li><a href="#">三月</a></li>
                    <li><a href="#">二月</a></li>
                    <li><a href="#">一月</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>
<%--/body--%>
<%--/html--%>