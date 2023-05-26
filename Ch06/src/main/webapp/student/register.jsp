<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>student::register</title>
	</head>
	<body>
		<h3>student 등록하기</h3>
		
		<a href="./list.jsp">student 목록</a>
		<form action="./registerProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>학번</td>
					<td><input type="text" name="stdNo" placeholder="학번 입력"></td>
				</tr>			
				<tr>
					<td>이름</td>
					<td><input type="text" name="stdName" placeholder="이름 입력"></td>
				</tr>			
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="stdHp" placeholder="휴대폰 입력"></td>
				</tr>			
				<tr>
					<td>학년</td>
					<td><input type="number" name="stdYear" placeholder="학년 입력"></td>
				</tr>			
				<tr>
					<td>주소</td>
					<td><input type="text" name="stdAddress" placeholder="주소 입력"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"></td>
					<td><input type="submit" value="등록하기"></td>
				</tr>			
			</table>
		</form>
	</body>
</html>