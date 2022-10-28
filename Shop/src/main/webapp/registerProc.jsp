<%@page import="com.google.gson.JsonObject"%>
<%@page import="config.DBCP"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
// json 데이터를 보내줘야해서 application/json으로 수정
	request.setCharacterEncoding("utf-8");
	String prodNo = request.getParameter("prodNo");
	String prodCount = request.getParameter("prodCount");
	String prodOrderer = request.getParameter("prodOrderer");
	
	int result = 0;
	
	try{
		Connection conn = DBCP.getConnection();
		String sql  = "insert into `order` (`orderId`, `orderProduct`, `orderCount`, `orderDate`) ";
			   sql += "values (?, ?, ?, NOW())";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, prodOrderer);
		psmt.setString(2, prodNo);
		psmt.setString(3, prodCount);
		
		result = psmt.executeUpdate();
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);
%>