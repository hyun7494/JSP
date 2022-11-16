<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<main>
	<form action="#">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="uid" placeholder="아이디 입력"/>
					<button type="button" id="btnUidCheck"><img src="/Farmstore1/img/chk_id.gif" alt="중복확인"/></button>
					<!-- button의 기본 타입은 submit이라 버튼을 누르면 id 유효성 체크를 하는 ajax 함수를 실행하기 위하여
						의미없는 type=button을 주었음 -->
					<span class="resultUid"></span>
				</td>
			</tr>
		</table>
	</form>
</main>
<%@ include file="../_footer.jsp" %>
        