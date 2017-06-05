<%@ page import="java.io.File" %>
<%@page language="java" contentType="text/html; utf-8" isErrorPage="true" pageEncoding="UTF-8" %>
not found ：<%=request.getRequestURL()%>
<%
    File file = new File(".");
%>
<%=file.getTotalSpace()%>
<%=file.getFreeSpace()%>