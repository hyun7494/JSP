<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String custId    = request.getParameter("CustId");
	String Name   = request.getParameter("Name");
	String Address  = request.getParameter("Address");
	String Phone = request.getParameter("Phone");

	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "update `customer` set `Name`=?, `Address`=?, `Phone`=? ";
		       sql += "where `CustId`=?";
		       
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, Name);
		psmt.setString(2, Address);
		psmt.setString(3, Phone);
		psmt.setString(4, custId);

		psmt.executeUpdate();
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
	
%>