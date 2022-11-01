<%@page import="com.google.gson.JsonObject"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String pg      = request.getParameter("pg");
	String parent  = request.getParameter("parent");
	String content = request.getParameter("content");
	String uid     = request.getParameter("uid");
	String regip   = request.getRemoteAddr();

	ArticleBean comment = new ArticleBean();
	comment.setParent(parent);
	comment.setContent(content);
	comment.setUid(uid);
	comment.setRegip(regip);
	
	// insertComment에서 article에 리턴해야함
	ArticleBean article = ArticleDAO.getInstance().insertComment(comment);
	
	/* json쓸거라 밑에꺼 사용안할거임
	response.sendRedirect("/JBoard1/view.jsp?no="+parent+"&pg="+pg);
	*/
	
	// Json 출력 (gson 사용함)
	JsonObject json = new JsonObject();
	json.addProperty("result", 1);
	json.addProperty("no", article.getNo());
	json.addProperty("parent", article.getParent());
	json.addProperty("nick", article.getNick());
	json.addProperty("date", article.getRdate());
	json.addProperty("content", article.getContent());
	
	String jsonData = json.toString();
	out.print(jsonData);
	
%>