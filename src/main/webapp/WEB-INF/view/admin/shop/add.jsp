<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/view/_Layout/basic_header_admin.jsp" %>
<div class="container">
    <h1>${msg}</h1>
    <div class="row ">
        <section class="panel panel-primary">
            <div class="panel-heading text-center">
                上架商品
            </div>
            <div class="panel-body bio-graph-info">
                <h1> 商品详细信息</h1>
                <div class="col-md-4">
                    <div class="form-group">
                        <div class="col-lg-6">
                            <img src="${pageContext.request.contextPath}/public/images/shop.jpg" id="show_img"
                                 class="img-responsive"/>
                            <input name="" id="h_img_url" type="hidden" class="form-control"/>
                            <input name="headerImg" id="h_img" type="file" class="form-control"/>
                            <button class="btn btn-default" id="img_upload" onclick="ajaxFileUpload()">上传</button>
                        </div>
                        <label class="col-lg-12 control-label">商品首图</label>
                    </div>
                </div>
                <form class="form-horizontal" role="form" action="" method="post">
                    <div class="col-md-8">
                        <div class="form-group">
                            <label class="col-lg-2 control-label">商品名</label>
                            <div class="col-lg-6">
                                <input name="headerImg" id="headerImg" type="hidden" value="/public/images/shop.jpg"/>
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
                    </div>
                    <div class="form-group col-md-12">
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
                    <div class="form-group col-md-12">
                        <div class="text-center">
                            <button type="submit" class="btn btn-success btn-block">上架</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </div>
</div>
<script src="${pageContext.request.contextPath}/public/js/ajaxfileupload.js"></script>
<script>

    //异步上传图片
    function ajaxFileUpload() {
        $.ajaxFileUpload(
            {
                url: '<%=request.getContextPath()%>/admin/shop/upload/', //用于文件上传的服务器端请求地址
                secureuri: false, //是否需要安全协议，一般设置为false
                fileElementId: 'h_img', //文件上传域的ID
                dataType: 'json', //返回值类型 一般设置为json
                timeout: 0,
                success: function (resp, status) //服务器成功响应处理函数
                {
                    console.log(resp);
                    $("#show_img").attr("src", resp.data);
                    $("#headerImg").val(resp.data);
                }
            }
        );
        return false;
    }
</script>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>