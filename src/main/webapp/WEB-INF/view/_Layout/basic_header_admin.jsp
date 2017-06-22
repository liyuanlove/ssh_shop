<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="zh_CN">
<head>
    <title>${html_title}</title>
    <%--meta--%>
    <%@include file="basic_metas.jsp" %>
    <%--导入前端框架样式文件--%>
    <link href="${pageContext.request.contextPath}/public/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/public/css/bootstrap-reset.css" rel="stylesheet" type="text/css">
    <!--external css-->
    <link href="${pageContext.request.contextPath}/public/css/font-awesome.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/public/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/public/css/style-responsive.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/public/css/tasks.css" rel="stylesheet" type="text/css">
    <%--IE9的HTML5支持--%>
    <%@include file="basic_support_js.jsp" %>
</head>
<body>