<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String bookId    = request.getParameter("BookId");
	String bookName   = request.getParameter("BookName");
	String publisher  = request.getParameter("Publisher");
	String price = request.getParameter("Price");

	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "update `book` set `BookName`=?, `Publisher`=?, `Price`=? ";
		       sql += "where `BookId`=?";
		       
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, bookName);
		psmt.setString(2, publisher);
		psmt.setString(3, price);
		psmt.setString(4, bookId);

		psmt.executeUpdate();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
	
%>