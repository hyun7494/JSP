<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_표현언어 내장객체</title>
		<!-- 
			날짜 : 2022/11/07
			이름 : 김현준
			내용 : JSP 표현언어 내장객체 실습하기
		 -->
	</head>
	<body>
		<h3>2.표현언어 내장객체</h3>
		<%
			pageContext.setAttribute("name", "김유신");
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "강감찬");
		%>
		<p>
			<!-- 
			pageContext name : ${name}<br/>
			request name : ${name}<br/>
			session name : ${name}<br/>
			application name : ${name}<br/>
				이렇게 하면 pageContext줄만 출력됨
				스코프 지정해줘야 나머지 애들도 출력
			 -->
			pageContext name : ${pageScope.name}<br/>
			request name : ${requestScope.name}<br/>
			session name : ${sessionScope.name}<br/>
			application name : ${applicationScope.name}<br/>
		</p>
	</body>
</html>