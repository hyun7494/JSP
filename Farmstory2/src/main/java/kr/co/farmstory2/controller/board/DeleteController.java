package kr.co.farmstory2.controller.board;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.dao.ArticleDAO;

@WebServlet("/board/delete.do")
public class DeleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String pg = req.getParameter("pg");
		String no = req.getParameter("no");
		
		ArticleDAO dao = ArticleDAO.getInstance();
		
		// 글삭제 + 댓글 삭제
		dao.deleteArticle(no);
		
		// 파일 삭제(DB)
		String fileName = dao.deleteFile(no);
		
		// 파일 삭제(디렉토리)
		if(fileName != null){
			
			String path = req.getSession().getServletContext().getRealPath("/file");
			
			File file = new File(path+"/"+fileName);
			
			if(file.exists()){
				file.delete();
			}
			
		}

		resp.sendRedirect("/Farmstory2/board/list.jsp?group="+group+"&cate="+cate+"&pg="+pg);

	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	

}