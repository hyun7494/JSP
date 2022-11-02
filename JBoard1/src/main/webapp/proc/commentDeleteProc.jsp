<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no"); // 댓글 번호
	
	int result = ArticleDAO.getInstance().deleteComment(no);

	// json 출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	
	out.print(json.toString());
%>