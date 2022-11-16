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
		String sql = "SELECT * FROM `lecture`";
		ResultSet rs = stmt.executeQuery(sql);		
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
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>강좌관리</title>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>    <script>

	$(function(){
		$('.open').on('click', function(){
			$('.lectureform').fadeIn(100);
		  });
		$('.close').on('click', function(){
			$('.lectureform').hide(100);
		  });

		$('input[type=submit]').click(function(){
			
			let lecNo = $('input[name=lecNo]').val();
			let lecName = $('input[name=lecName]').val();
			let lecCredit = $('input[name=lecCredit]').val();
			let lecTime= $('input[name=lecTime]').val();
			let lecClass = $('input[name=lecClass]').val();
			
			let jsonData = {
					"lecNo": lecNo,
					"lecName": lecName,
					"lecCredit": lecCredit,
					"lecTime": lecTime,
					"lecClass": lecClass,
			};
			
			console.log('jsonData')
			
			$.ajax({
				url: './proc/lectureProc.jsp',
				type: 'POST',
				data: jsonData,
				dataType: 'json',
				success:function(data){
					if(data.result == 1 ){
						alert('등록완료!');
					}else{
						alert('등록실패!');
					}
				}
			});
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
	
	<section class="lectureform" style="display:none">
    <h4>강좌등록</h4>
    <input type="button" class="close" value="닫기">
    <form action="/College/proc/lectureProc.jsp" method="post">
        <table border="1">
            <tr>
                <td>번호</td>
                <td><input type="text" name="lecNo"></td>
            </tr>
            <tr>
                <td>강좌명</td>
                <td><input type="text" name="lecName"></td>
            </tr>
            <tr>
                <td>학점</td>
                <td><input type="text" name="lecCredit"></td>
            </tr>
            <tr>
                <td>시간</td>
                <td><input type="text" name="lecTime"></td>
            </tr>
            <tr>
                <td>강의장</td>
                <td><input type="text" name="lecClass"></td>
            <tr>
				 <td colspan="2" align="right"> <button class="btnAdd">추가</button> </td>
			</tr>
           
        </table>
    </form>
    </section>
</body>
</html>