<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <% List<Map<String,Object>> test =  (List)request.getAttribute("test");%>
  <% 
    for(Map<String, Object> t :test){
    	%>
    	<%=t.get("name") %>
    	<%
    }
  %>
</body>
</html>