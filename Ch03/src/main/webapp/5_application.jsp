
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>5_application</title>
		<!-- 
			날짜 : 2022/10/06
			이름 : 김현준
			내용 : JSP application 내장객체 실습하기
		 -->
	</head>
	<body>
		<h3>application 객체</h3>
		
		<h4>서버 정보</h4>
		<%= application.getServerInfo() %>
		
		
		<h4>application 파라미터 목록</h4>
		<%
			Enumeration<String> initParams = application.getInitParameterNames();
			
			while(initParams.hasMoreElements()){
				String paramName = initParams.nextElement();
				String paramValue = application.getInitParameter(paramName);
				
				out.println("파라미터 이름 : "+paramName+"<br/>");
				out.println("파라미터 값 : "+paramValue+"<br/>");
			}
		
		%>
		
		<h4>로그 기록</h4>
		<%
			application.log("로그기록 합니다.");
		%>
		
	</body>
</html>