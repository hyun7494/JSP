<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>
	<body>
		<h3>도서수정</h3>
		<a href="/Bookstore2/">처음으로</a>
		<a href="/Bookstore2/book/list.do">도서목록</a>
		
		<form action="/Bookstore2/book/modify.do" method="post">
		<table border="1">
			<tr>
				<td>도서번호</td>
				<td><input type="text" name="bookID" readonly value="${requestScope.vo.bookId}"></td>
			</tr>
			<tr>
				<td>도서명</td>
				<td><input type="text" name="bookName" value="${vo.bookName}"></td>
			</tr>
			<tr>
				<td>출판사</td>
				<td><input type="text" name="publisher" value="${vo.publisher}"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="${vo.price}"></td>
			</tr>
			<tr>
				 <td colspan="2" align="right"> <button class="btnAdd">수정</button> </td>
			</tr>
		</table>
	</body>
</html>