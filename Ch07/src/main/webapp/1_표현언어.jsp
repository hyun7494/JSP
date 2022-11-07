<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_표현언어</title>
		<!-- 
			날짜 : 2022/11/07
			이름 : 김현준
			내용 : JSP 표현언어(Expression Language) 실습하기
		 -->
			
	</head>
	<body>
		<h3>1.표현언어</h3>
		<%
			String name = "홍길동";
			int num1 = 1;
			int num2 = 2;
			
			pageContext.setAttribute("name", name);
			request.setAttribute("num1", num1);
			session.setAttribute("num2", num2);
		%>
		<h4>표현식</h4>
		<p>
			name : <%= name %><br/>
			num1 : <%= num1 %><br/>
			num2 : <%= num2 %><br/>
			num3 : <%= num1 + num2 %>
		</p>
		
		<h4>표현언어</h4>
		<p>
			name : ${name}<br/>
			<!-- 스크립트릿 직접 참조 불가(내장 객체를 통해서 값을 설정해야 가능)
				pageContext.setAttribute("name", name); 
				어떤 스코프이던지 상관 없다
			-->
			num1 : $(num1)<br/>
			num2 : $(num2)<br/>
			num3 : $(num1+num2)<br/>
		</p>
		
	</body>
</html>