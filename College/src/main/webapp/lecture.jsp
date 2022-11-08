<%@page import="bean.LectureBean"%>
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
	List<LectureBean> lectures = null;
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `lecture`");
		
		lectures = new ArrayList<>();
		
		while(rs.next()){
			LectureBean lb = new LectureBean();
			lb.setLecNo(rs.getInt(1));
			lb.setLecName(rs.getString(2));
			lb.setLecCredit(rs.getInt(3));
			lb.setLecTime(rs.getInt(4));
			lb.setLecClass(rs.getString(5));
			
			lectures.add(lb);
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
    <title>강좌관리</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>    <script>

	$(function(){
		$('.open').on('click', function(){
			$('.registerform').fadeIn(100);
		  });
		$('.close').on('click', function(){
			$('.registerform').hide(100);
		  });

	});

</script>
</head>
<body>

    <h3>강좌관리</h3>
    <a href="./lecture.jsp">강좌관리</a>
    <a href="./register.jsp">수강관리</a>
    <a href="./student.jsp">학생관리</a>
    
    <h4>강좌현황</h4>
    <input type="button" class="open" value="등록">
    	   
    <table border="1">
        <tr>
            <td>번호</td>
            <td>강좌명</td>
            <td>학점</td>
            <td>시간</td>
            <td>강의장</td>
        </tr>
           	<% for(LectureBean lb : lectures){ %>
        <tr>
            <td><%= lb.getLecNo() %></td>
            <td><%= lb.getLecName() %></td>
            <td><%= lb.getLecCredit() %></td>
            <td><%= lb.getLecTime() %></td>
            <td><%= lb.getLecClass() %></td>
        </tr>
        	<% } %>
    </table>
	
	<section class="registerform" style="display:none">
    <h4>강좌등록</h4>
    <input type="button" class="close" value="닫기">
    <form action="/College/lectureProc.jsp" method="post">
        <table border="1">
            <tr>
                <td>번호</td>
                <td><input type="number" name="lecNo"></td>
            </tr>
            <tr>
                <td>강좌명</td>
                <td><input type="text" name="lecName"></td>
            </tr>
            <tr>
                <td>학점</td>
                <td><input type="number" name="lecCredit"></td>
            </tr>
            <tr>
                <td>시간</td>
                <td><input type="number" name="lecTime"></td>
            </tr>
            <tr>
                <td>강의장</td>
                <td><input type="text" name="lecClass"></td>
            <tr>
				<td colspan="2" align="right"><input type="submit" value="추가"/></td>
			</tr>
           
        </table>
    </form>
    </section>
</body>
</html>