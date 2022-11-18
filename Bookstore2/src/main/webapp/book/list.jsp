<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<h3>도서목록</h3>
		<a href="/Bookstore2/index.jsp">처음으로</a>
		<a href="/Bookstore2/book/register.do">도서등록</a>
		
		<table border="1">
			<tr>
				<td>도서번호</td>
				<td>도서명</td>
				<td>출판사</td>
				<td>가격</td>
				<td>관리</td>
			</tr>
			<c:forEach var="book" items="${books}">
				<tr>
					<td>${book.getBookId()}</td>
					<td>${book.getBookName()}</td>
					<td>${book.getPublisher()}</td>
					<td>${book.getPrice()}</td>
					<td>
						<a href="/Bookstore2/book/modify.do?bookId=${book.bookId}">수정</a>
						<a href="/Bookstore2/book/delete.do?bookId=${book.bookId}">삭제</a>
					</td>
				</tr>
			</c:forEach>
			
		</table>
	</body>
</html>