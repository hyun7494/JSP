<%@page import="kr.co.farmstory1.bean.UserBean"%>
<%@page import="kr.co.farmstory1.dao.UserDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	UserBean ub = UserDAO.getInstance().selectUser(uid, pass);
	
	if(ub != null){
		// 회원이 맞을 경우
		// setAttribute는 name, value 쌍으로 객체 Object를 저장하는 메서드다.
		// 세션이 유지되는 동안 저장된다.
		session.setAttribute("sessUser", ub);
		//홈 화면으로 가게 해줌
		response.sendRedirect("/Farmstory1");
		
	}else{
		// 회원이 아닐 경우
		response.sendRedirect("/Farmstory1/user/login.jsp?success=100");
	}
	%>