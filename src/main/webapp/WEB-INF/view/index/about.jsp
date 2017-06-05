<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="sub-banner-wthree">
    <h3>关于我们</h3>
</div>
<div class="about-w3layouts">

    <div class="col-md-6 about-left-w3-agileits">
        <div id="top" class="callbacks_container">
            <ul class="rslides" id="slider4">
                <li>
                    <div class="ser-info wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                        <h3>精品水果源于Fresh</h3>
                        <p>只为一份极致的新鲜</p>
                    </div>

                </li>
                <li>
                    <div class="ser-info wow fadeInUp" data-wow-duration="1s" data-wow-delay=".3s">
                        <h3>品质水果领导者</h3>
                        <p>送货上门 品质到家</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/public/js/responsiveslides.min.js"></script>
    <script>
        // You can also use "$(window).load(function() {"
        $(function () {
            // Slideshow 4
            $("#slider4").responsiveSlides({
                auto: true,
                pager: false,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                before: function () {
                    $('.events').append("<li>before event fired.</li>");
                },
                after: function () {
                    $('.events').append("<li>after event fired.</li>");
                }
            });

        });
    </script>
    <div class="col-md-6 about-text-w3ls">
        <h4>你不知道的Fresh</h4>
        <p>
            Fresh，是一家基于互联网技术的现代鲜果服务供应商，提供高品质鲜果产品和个性化鲜果服务。Fresh，成立于2017年4月1日，前身为传统水果商，有丰富的食品行业经验。精选全球鲜果美食，搭建从产地到消费者之间的直供平台，自建冷库，冷链物流。便利宅送，全年无休。主营中高端水果产品，包括进口鲜果和国内优质鲜果。Fresh拥有网站订购，电话订购，电视购物(东方CJ)、企业直供(大客户定制)和实体服务点等多元供应渠道。团体大客户，可享受量身定制产品的服务。Fresh的愿望是，让客户享受到真正健康、美味的世界鲜果和管家式体贴放心的服务。</p>
        <p class="agileits-wthree">质优――严格挑选营养、安全、果味浓郁的全球佳果。

            健康――通过鲜果大使，传播健康生活理念。

            便利――订购、支付方式多样，简单便利。

            快速――闪电宅配，自有物流可配送到指定地点，售后服务快速响应。

            放心――客服响应快速，周到的售前售后服务，营造省心放心的购物体验。</p>
        <a href="single.html" class="spcl">更多</a>

    </div>
    <div class="clearfix"></div>
</div>
<!--//about-->
<div class="about-bottom">
    <div class="container">
        <h3>企业理念</h3>
        <p>企业信念:世上最好的水果应该最新鲜到消费者手中。

            "用户100%放心购物，100%满意是我们的一贯追求，用我们的品质，用我们的服务，用我们的专业，我们让您相信优果是值得您信赖的品牌。"</p>
        <a href="single.html">更多</a>
    </div>
</div>
<!--team-->
<div class="team-section">
    <div class="container">
        <h2>设计师</h2>
        <div class="team-grids">
            <div class="col-md-4 team-grid">
                <div class="ih-item circle effect1"><a href="#">
                    <div class="spinner"></div>
                    <div class="img"><img src="${pageContext.request.contextPath}/public/images/pic-1.jpg" alt="img">
                    </div>
                    <div class="info">
                        <div class="info-back">
                            <h4>谭伟龙</h4>
                            <span>设计总监</span>
                        </div>
                    </div>
                </a>
                </div>
                <p>品牌设计师</p>
                <div class="about-social-icons-w3-agile">
                    <ul>
                        <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4 team-grid team-grid2">
                <div class="ih-item circle effect1"><a href="#">
                    <div class="spinner"></div>
                    <div class="img"><img src="${pageContext.request.contextPath}/public/images/pic-2.jpg" alt="img">
                    </div>
                    <div class="info">
                        <div class="info-back">
                            <h4>吴晓宁</h4>
                            <span>销售经理</span>
                        </div>
                    </div>
                </a>
                </div>
                <p>精英销售师</p>
                <div class="about-social-icons-w3-agile">
                    <ul>
                        <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4 team-grid">
                <div class="ih-item circle effect1"><a href="#">
                    <div class="spinner"></div>
                    <div class="img"><img src="${pageContext.request.contextPath}/public/images/pic-3.jpg" alt="img">
                    </div>
                    <div class="info">
                        <div class="info-back">
                            <h4>黄普权</h4>
                            <span>总裁</span>
                        </div>
                    </div>
                </a>
                </div>
                <p>CEO</p>
                <div class="about-social-icons-w3-agile">
                    <ul>
                        <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>