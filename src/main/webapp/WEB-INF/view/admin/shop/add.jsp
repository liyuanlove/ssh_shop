<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/_Layout/basic_header_admin.jsp" %>
<div class="container">
    <div class="row ">
        <aside class="profile-info col-lg-12">
            <section class="panel panel-primary">
                <div class="panel-heading text-center">
                    发布商品
                </div>
                <div class="panel-body bio-graph-info">
                    <h1> 书籍信息</h1>
                    <form class="form-horizontal" role="form" action="publish.html?a=pub" method="post">
                        <div class="form-group">
                            <label class="col-lg-2 control-label">书名</label>
                            <div class="col-lg-6">
                                <input name="title" required placeholder="输入名称" class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">售价</label>
                            <div class="col-lg-6">
                                <input type="text" required name="price" class="form-control"
                                       placeholder=" 请输入售价">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">数量</label>
                            <div class="col-lg-6">
                                <input type="number" required name="num" class="form-control"
                                       placeholder=" 请输入数量">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">商品详细描述</label>
                            <div class="col-lg-12 fb-gray-bg">
                                <textarea name="intro" rows="50" class="form-control" id="txt_content"
                                          placeholder=" 详细描述">
                                    </textarea>
                            </div>
                            <script src="//cdn.ckeditor.com/4.6.1/full/ckeditor.js"></script>
                            <script type="text/javascript">

                                CKEDITOR.replace('txt_content',
                                    {
                                        height: '400px',
                                        customConfig: '<%=request.getContextPath()%>/public/js/ckeditor_config.js',
                                        filebrowserImageUploadUrl: "<%=request.getContextPath()%>/action/upload/image"
                                    });
                            </script>
                        </div>
                        <div class="form-group">
                            <div class="text-center">
                                <button type="submit" class="btn btn-success">发布</button>
                                <button type="button" class="btn btn-default">取消</button>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </aside>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>