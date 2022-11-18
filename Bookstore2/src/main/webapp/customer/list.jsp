<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<h3>고객목록</h3>
		<a href="/Bookstore2/">처음으로</a>
		<a href="/Bookstore2/customer/register.do">고객등록</a>
		
		<table border="1">
			<tr>
				<td>도서번호</td>
				<td>도서명</td>
				<td>출판사</td>
				<td>가격</td>
				<td>관리</td>
			</tr>
			<c:forEach var="customer" items="${custs}">
				<tr>
					<td>${customer.getCustId()}</td>
					<td>${customer.getName()}</td>
					<td>${customer.getAddress()}</td>
					<td>${customer.getPhone()}</td>
					<td>
						<a href="/Bookstore2/modify.do?custId=${customer.custId}">수정</a>
						<a href="/Bookstore2/delete.do?custId=${customer.custId}">삭제</a>
					</td>
				</tr>
			</c:forEach>
			
		</table>
	</body>
</html>