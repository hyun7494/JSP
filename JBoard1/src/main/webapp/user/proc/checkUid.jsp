<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.db.SQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid = request.getParameter("uid");
	
	// 데이터베이스 확인
	int result = UserDAO.getInstance().selectCountUid(uid);
	
	// JSON 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	String jsonData = json.toString();
	out.print(jsonData);
%>