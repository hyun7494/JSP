<%@page import="db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String stdNo   = request.getParameter("stdNo");
	String stdName = request.getParameter("stdName");
	String stdHp  = request.getParameter("stdHp");
	String stdYear  = request.getParameter("stdYear");
	String stdAddress = request.getParameter("stdAddress");

	// 데이터베이스 작업
	try{
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_STUDENT);
		psmt.setString(1, stdNo);
		psmt.setString(2, stdName);
		psmt.setString(3, stdHp);
		psmt.setString(4, stdYear);
		psmt.setString(5, stdAddress);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();		
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("/College/student.jsp");
%>