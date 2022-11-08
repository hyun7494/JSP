<%@page import="bean.StudentBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBCP"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<RegisterBean> registers = null;
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `student`");
		
		registers = new ArrayList<>();
		
		while(rs.next()){
			RegisterBean rb = new RegisterBean();
			rb.setStdNo(rs.getString(1));
			rb.setStdName(rs.getString(2));
			rb.setStdHp(rs.getString(3));
			rb.setStdYear(rs.getInt(4));
			rb.setStdAddress(rs.getString(5));
			
			registers.add(rb);
		}
	
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	};
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>학생관리</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>    <script>

	$(function(){
		$('.open').on('click', function(){
			$('.register').fadeIn(100);
		  });
		$('.close').on('click', function(){
			$('.register').hide(100);
		  });

	});

</script>
</head>
<body>

    <h3>학생관리</h3>
    <a href="./lecture.jsp">강좌관리</a>
    <a href="./register.jsp">수강관리</a>
    <a href="./student.jsp">학생관리</a>
    
    <h4>수강현황</h4>
    	   
    <table border="1">
        <tr>
            <td>학번</td>
            <td>이름</td>
            <td>휴대폰</td>
            <td>학년</td>
            <td>주소</td>
        </tr>
           	<% for(RegisterBean rb : registers){ %>
        <tr>
            <td><%= rb.getStdNo() %></td>
            <td><%= rb.getStdName() %></td>
            <td><%= rb.getStdHp() %></td>
            <td><%= rb.getStdYear() %></td>
            <td><%= rb.getStdAddress() %></td>
        </tr>
        	<% } %>
    </table>
	
	<section>
    <h4>수강신청</h4>
    <input type="button" class="close" value="닫기">
    <form action="#">
        <table border="1" class="register" style="display:none">
            <tr>
                <td>학번</td>
                <td><input type="text" name="stdNo"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="stdName"></td>
            </tr>
            <tr>
                <td>신청강좌</td>
                <td><input type="text" name="stdHp"></td>
            </tr>
            <tr>
				<td colspan="2" align="right"><input type="submit" value="등록"/></td>
			</tr>
           
        </table>
    </form>
    </section>
</body>
</html>