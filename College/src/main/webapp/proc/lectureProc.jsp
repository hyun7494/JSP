<%@page import="com.google.gson.JsonObject"%>
<%@page import="db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String lecNo   = request.getParameter("lecNo");
	String lecName = request.getParameter("lecName");
	String lecCredit  = request.getParameter("lecCredit");
	String lecTime  = request.getParameter("lecTime");
	String lecClass = request.getParameter("lecClass");

	int result = 0;
	// 데이터베이스 작업
	try{
		Connection conn = DBCP.getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_LECTURE);
		psmt.setString(1, lecNo);
		psmt.setString(2, lecName);
		psmt.setString(3, lecCredit);
		psmt.setString(4, lecTime);
		psmt.setString(5, lecClass);
		
		result = psmt.executeUpdate();
		
		psmt.close();
		conn.close();		
	}catch(Exception e){
		e.printStackTrace();
	}
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);
	response.sendRedirect("/College/lecture.jsp");
%>