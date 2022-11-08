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
	List<StudentBean> students = null;
	
	try{
		Connection conn = DBCP.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM `student`");
		
		students = new ArrayList<>();
		
		while(rs.next()){
			StudentBean sb = new StudentBean();
			sb.setStdNo(rs.getString(1));
			sb.setStdName(rs.getString(2));
			sb.setStdHp(rs.getString(3));
			sb.setStdYear(rs.getInt(4));
			sb.setStdAddress(rs.getString(5));
			
			students.add(sb);
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
			$('.registerform').fadeIn(100);
		  });
		$('.close').on('click', function(){
			$('.registerform').hide(100);
		  });
		
		
		$('input[type=submit]').click(function(){
            e.preventDefault();
            // 입력 데이터 가져오기
            let stdNo  = $('input[name=stdNo]').val();
            let stdName = $('input[name=stdName]').val();
            let stdHp   = $('input[name=stdHp]').val();
            let stdYear  = $('input[name=stdYear]').val();
            let stdAddress  = $('input[name=stdAddress]').val();

            // 전송 데이터 생성(JSON)
            let jsonData = {
                "stdNo":stdNo,
                "stdName":stdName,
                "stdHp":stdHp,
                "stdYear":stdYear
                "stdAddress":stdAddress
            };

            console.log(jsonData);

            // 데이터 전송                
            $.ajax({
                url: '/College/studentProc.jsp',
                type: 'GET',
                data: jsonData,
                dataType: 'json',
                success:function(data){
                    alert('데이터 전송 성공!');
                }
            });
            

        });

	});

</script>
</head>
<body>

    <h3>학생관리</h3>
    <a href="./lecture.jsp">강좌관리</a>
    <a href="./register.jsp">수강관리</a>
    <a href="./student.jsp">학생관리</a>
    
    <h4>학생목록</h4>
    <input type="button" class="open" value="등록">
    	   
    <table border="1">
        <tr>
            <td>학번</td>
            <td>이름</td>
            <td>휴대폰</td>
            <td>학년</td>
            <td>주소</td>
        </tr>
           	<% for(StudentBean sb : students){ %>
        <tr>
            <td><%= sb.getStdNo() %></td>
            <td><%= sb.getStdName() %></td>
            <td><%= sb.getStdHp() %></td>
            <td><%= sb.getStdYear() %></td>
            <td><%= sb.getStdAddress() %></td>
        </tr>
        	<% } %>
    </table>
	
	<section class="registerform" style="display:none">
    <h4>학생등록</h4>
    <input type="button" class="close" value="닫기">
    <form action="/College/studentProc.jsp" method="post">
        <table border="1">
            <tr>
                <td>학번</td>
                <td><input type="text" name="stdNo"></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="stdName"></td>
            </tr>
            <tr>
                <td>휴대폰</td>
                <td><input type="text" name="stdHp"></td>
            </tr>
            <tr>
                <td>학년</td>
                <td>
                	<select name="stdYear">
                		<option value="1">1학년</option>
                		<option value="2">2학년</option>
                		<option value="3">3학년</option>
                		<option value="4">4학년</option>
                	</select>
                </td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" name="stdAddress"></td>
            <tr>
				<td colspan="2" align="right"><input type="submit" value="등록"/></td>
			</tr>
           
        </table>
    </form>
    </section>
</body>
</html>