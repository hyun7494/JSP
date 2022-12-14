<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../WEB-INF/_header.jsp"/>
<jsp:include page="./_${group}.jsp"/>
<script>
	$(document).ready(function(){
		
		// 삭제하기
		$(document).on('click', '.remove', function(e){
			e.preventDefault();
			
			let tag = $(this);
			let result = confirm('정말 삭제 하시겠습니까?');
			
			if(result){
				
				let no = $(this).attr('data-no');
				
				$.ajax({
					url: '/Farmstory2/board/commentDelete.do?no='+no,
					type: 'GET',
					dataType: 'json',
					success: function(data){
						
						if(data.result > 0){
							alert('댓글이 삭제 되었습니다.');
							
							// 화면삭제
							tag.closest('article').hide();
						}
					}
				});
			}
		});
		
		// 수정하기
		$(document).on('click', '.modify', function(e){
			e.preventDefault();
			
			let txt = $(this).text();
			let p = $(this).parent().prev();
			
			if(txt == '수정'){
				// 수정모드
				$(this).text('수정완료');				
				p.attr('contentEditable', true);
				p.focus();
			}else{
				// 수정완료
				$(this).text('수정');
				p.attr('contentEditable', false);	
				
				let no = $(this).attr('data-no');
				let content = p.text();
				
				let jsonData = {
					"no": no,
					"content": content
				};
				
				$.ajax({
					url: '/Farmstory2/board/commentModify.do',
					type: 'POST',
					data: jsonData,
					dataType: 'json',
					success: function(data){
						
						if(data.result > 0){
							alert('댓글이 수정되었습니다.');
						}
					}
				});
			}
			
			
		});
		
		// 댓글쓰기
		$('.commentForm > form').submit(function(){
			
			let pg 		= $(this).children('input[name=pg]').val();
			let parent 	= $(this).children('input[name=parent]').val();
			let uid 	= $(this).children('input[name=uid]').val();
			let textarea = $(this).children('textarea[name=content]');
			let content  = textarea.val();
						
			let jsonData = {
				"pg":pg,
				"parent":parent,
				"uid":uid,
				"content":content
			};
			
			console.log(jsonData);
			
			$.ajax({
				url : '/Farmstory2/board/commentWrite.do',
				method: 'POST',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					
					console.log(data);
					
					let article = "<article>";
						article += "<span class='nick'>"+data.nick+"</span>";
						article += "<span class='date'>"+data.date+"</span>";
						article += "<p class='content'>"+data.content+"</p>";
						article += "<div>";
						article += "<a href='#' class='remove' data-no='"+data.no+"'>삭제</a>";
						article += "<a href='#' class='modify' data-no='"+data.no+"'>수정</a>";
						article += "</div>";
						article += "</article>";
					
					$('.commentList > .empty').hide();
					$('.commentList').append(article);
					textarea.val('');
				}
			});
			
			return false;
		});
	});
</script>
<main id="board">
    <section class="view">
        <table border="0">
            <caption>글보기</caption>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="${article.title}" readonly/></td>
            </tr>
            <c:if test="${article.file > 0}">
            <tr>
                <th>파일</th>
                <td><a href="#">${article.oriName}</a>&nbsp;<span>${article.download}</span>회 다운로드</td>
            </tr>
            </c:if>
            <tr>
                <th>내용</th>
                <td>
                    <textarea name="content" readonly>${article.content}</textarea>
                </td>
            </tr>                    
        </table>
        <div>
            <a href="/Farmstory2/board/delete.do?group=${group}&cate=${cate}&no=${article.no}&pg=${pg}" class="btn btnRemove">삭제</a>
            <a href="/Farmstory2/board/modify.do?group=${group}&cate=${cate}&no=${article.no}&pg=${pg}" class="btn btnModify">수정</a>
            <a href="/Farmstory2/board/list.do?pg=${pg}&group=${group}&cate=${cate}" class="btn btnList">목록</a>
        </div>
        
        <!-- 댓글목록 -->
        <section class="commentList">
            <h3>댓글목록</h3>                   
            <article>
			<c:forEach var="comment" items="${comments}">
                <span class="nick">${comment.nick}</span>
                <span class="date">${comment.rdate}</span>
                <p class="content">${comment.content}</p>                        
                <div>
                    <a href="#" class="remove" data-no="${comment.no}">삭제</a>
                    <a href="#" class="modify" data-no="${comment.no}">수정</a>
                </div>
			</c:forEach>
			
            </article>
			<c:if test="${comments.size() == null}">
            <p class="empty">등록된 댓글이 없습니다.</p>
			</c:if>

        </section>

        <!-- 댓글쓰기 -->
        <section class="commentForm">
            <h3>댓글쓰기</h3>
            <form action="#" method="post">
            	<input type="hidden" name="pg" value="${pg}">
	        	<input type="hidden" name="parent" value="${no}">
	        	<input type="hidden" name="uid" value="${sessUser.uid}">
                <textarea name="content" placeholder="댓글 내용을 입력하세요."></textarea>
                <div>
                    <a href="#" class="btn btnCancel">취소</a>
                    <input type="submit" value="작성완료" class="btn btnComplete"/>
                </div>
            </form>
        </section>
    </section>
</main>
<jsp:include page="../WEB-INF/_footer.jsp"/>