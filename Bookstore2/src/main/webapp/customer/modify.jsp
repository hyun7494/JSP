<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<h3>고객수정</h3>
		<a href="/Bookstore2/index.do">처음으로</a>
		<a href="/Bookstore2/customer/list.do">고객목록</a>
		
		<table border="1">
			<tr>
				<td>고객번호</td>
				<td><input type="text" name="custNo"></td>
			</tr>
			<tr>
				<td>고객명</td>
				<td><input type="text" name="custName"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="custAddr"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="custHp"></td>
			</tr>
			<tr>
				 <td colspan="2" align="right"> <button class="btnAdd">수정</button> </td>
			</tr>
		</table>
	</body>
</html>