<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h3>내장객체 영역 확인</h3>
		<p>	
			PageContext 영역 : <%= pageContext.getAttribute("name") %><br/>
			request 영역 : <%= request.getAttribute("name") %><br/>
			session 영역 : <%= session.getAttribute("name") %><br/>
			application 영역 : <%= application.getAttribute("name") %><br/>
		</p>
	</body>
</html>