<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/view/_Layout/basic_header.jsp" %>
<%--body--%>
<%@include file="/WEB-INF/view/_Layout/front_navbar.jsp" %>
<div class="container">
    <div class="mail-box">
        <aside class="sm-side">
            <div class="user-head">
                <a href="javascript:;" class="inbox-avatar">
                    <img src="<%=request.getContextPath()%>/public/images/header.png" class="center-pill" alt="">
                </a>
            </div>
            <div class="inbox-body">
                <a class="btn btn-compose" data-toggle="modal" href="#myModal">
                    发送信息
                </a>
                <!-- Modal -->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title">发送信息</h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">收信人</label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="inputEmail1" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">简述</label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="cc" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">标题</label>
                                        <div class="col-lg-10">
                                            <input type="text" class="form-control" id="inputPassword1" placeholder="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">内容</label>
                                        <div class="col-lg-10">
                                            <textarea title="" id="" class="form-control" cols="30"
                                                      rows="10"></textarea>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                                      <span class="btn green fileinput-button">
                                                        <i class="fa fa-plus fa fa-white"></i>
                                                        <span>附件文件</span>
                                                        <input type="file" title="files[]">
                                                      </span>
                                            <button type="submit" class="btn btn-send">发送</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
            </div>

        </aside>
        <aside class="lg-side">
            <div class="inbox-body">
                <table class="table table-inbox table-hover">
                    <tbody>
                    <tr class="unread">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message  dont-show">电饭锅似乎</td>
                        <td class="view-message ">乱数假文悲哀坐特</td>
                        <td class="view-message  inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                        <td class="view-message  text-right">9:27</td>
                    </tr>
                    <tr class="unread">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">发都好</td>
                        <td class="view-message">你好 Bro, 最近怎么样</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">5月15日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">孔融吉他</td>
                        <td class="view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">6月 15日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">发哈幼儿班</td>
                        <td class="view-message">悲哀坐特，您adipiscing</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">4月 1日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">大怒人格不 <span
                                class="label label-danger pull-right">法乐</span></td>
                        <td class="view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">7月 23日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">A股个人</td>
                        <td class="view-message">悲哀坐特，您adipiscing</td>
                        <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">5月 14日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">热乎运动会</td>
                        <td class="view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">1月 19日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">途径图红谷滩胡歌 <span
                                class="label label-success pull-right">杂志</span>
                        </td>
                        <td class="view-message view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">5月 4日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">凤凰酥体会过</td>
                        <td class="view-message view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">6月 13日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">发生已收入提高 <span
                                class="label label-info pull-right">家庭</span></td>
                        <td class="view-message view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">5月 24日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">哈语饶河</td>
                        <td class="view-message">乱悲哀坐特，您adipiscing</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">5月 9日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                        <td class="dont-show">iOS积分哈UI而</td>
                        <td class="view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">4月 14日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">疏通日水电费</td>
                        <td class="view-message">悲哀坐特，您adipiscing</td>
                        <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">2月 25日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="dont-show">欧珀微积分</td>
                        <td class="view-message view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">5月 14日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">石佛寺护肤</td>
                        <td class="view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">4月 7日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">机房ISO如</td>
                        <td class="view-message">悲哀坐特，您adipiscing</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">7月 14日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">介入反倒是你放假</td>
                        <td class="view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">8月 10日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">炎热怒放</td>
                        <td class="view-message view-message">悲哀坐特，您adipiscing</td>
                        <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">4月 14日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">偶尔UR扼吭拊背</td>
                        <td class="view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">6月 16日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">威尔和遗憾</td>
                        <td class="view-message">乱数假文悲哀坐特</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">8月 10日</td>
                    </tr>
                    <tr class="">
                        <td class="inbox-small-cells">
                            <input type="checkbox" class="mail-checkbox">
                        </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">热带鱼法国队和部分</td>
                        <td class="view-message view-message">悲哀坐特，您adipiscing</td>
                        <td class="view-message inbox-small-cells"><i class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">4月 14日</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </aside>
    </div>
</div>
<%@include file="/WEB-INF/view/_Layout/front_copyright.jsp" %>
<%@include file="/WEB-INF/view/_Layout/basic_footer.jsp" %>