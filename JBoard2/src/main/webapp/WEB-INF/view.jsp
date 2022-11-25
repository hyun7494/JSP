<%@page import="java.util.List"%>
<%@page import="kr.co.jboard2.vo.ArticleVO"%>
<%@page import="kr.co.jboard2.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
// 서버에서 실행 ------------------------------------------

	// DAO 객체 가져오기
	ArticleDAO dao = ArticleDAO.getInstance();
	
	// 글 조회수 카운트 +1
	dao.updateArticleHit(no);
	
	// 글 가져오기
	ArticleVO vo = dao.seselectArticle();
	
	// 댓글 가져오기
	List<ArticleVO> comments = dao.selectComments(no);
	
// --------------------------------------------------------------

%>
<jsp:include page="./_header.jsp"/>
        <main id="board">
            <section class="view">
                
                <table border="0">
                    <caption>글보기</caption>
                    <tr>
                        <th>제목</th>
                        <td><input type="text" name="title" value="${vo.title}" readonly/></td>
                    </tr>
                    <% if(vo.getFile() > 0){ %>
                    <tr>
                        <th>파일</th>
                        <td><a href="/JBoard2/download.do?fno=<%= vo.getFno() %>"><%= vo.getOriName() %></a>&nbsp;<span><%= vo.getDownload() %></span>회 다운로드</td>
                    </tr>
                    <% } %>
                    <tr>
                        <th>내용</th>
                        <td>
                            <textarea name="content" readonly><%= vo.getContent() %></textarea>
                        </td>
                    </tr>                    
                </table>
                
                <div>
                <% if(sessUser.getUid().equals(vo.getUid())){ %>
                    <a href="/JBoard2/remove.do" class="btn btnRemove">삭제</a>
                    <a href="/JBoard2/modify.do" class="btn btnModify">수정</a>
                <% } %>
                    <a href="/JBoard2/list.do" class="btn btnList">목록</a>
                </div>

                <!-- 댓글목록 -->
                <section class="commentList">
                    <h3>댓글목록</h3>                   

                    <article>
                        <span class="nick">길동이</span>
                        <span class="date">20-05-20</span>
                        <p class="content">댓글 샘플 입니다.</p>                        
                        <div>
                            <a href="#" class="remove">삭제</a>
                            <a href="#" class="modify">수정</a>
                        </div>
                    </article>

                    <p class="empty">등록된 댓글이 없습니다.</p>

                </section>

                <!-- 댓글쓰기 -->
                <section class="commentForm">
                    <h3>댓글쓰기</h3>
                    <form action="#">
                        <textarea name="content">댓글내용 입력</textarea>
                        <div>
                            <a href="#" class="btn btnCancel">취소</a>
                            <input type="submit" value="작성완료" class="btn btnComplete"/>
                        </div>
                    </form>
                </section>

            </section>
        </main>
<jsp:include page="./_footer.jsp"/>