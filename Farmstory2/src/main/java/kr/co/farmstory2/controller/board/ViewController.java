package kr.co.farmstory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.vo.ArticleVO;

@WebServlet("/board/view.do")
public class ViewController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// <% %>대신 여기서 연결하자
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		//
		String pg = req.getParameter("pg");
		String no = req.getParameter("no");
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		req.setAttribute("pg", pg);
		req.setAttribute("no", no);
		
		// DAO 객체 생성
		ArticleDAO dao = ArticleDAO.getInstance();
		ArticleService service = ArticleService.INSTANCE;
		
		// 글 가져오기
		ArticleVO article = service.selectArticle(no);
		req.setAttribute("article", article);
		
		// 글 조회수 증가
		dao.updateArticleHit(no);
		


		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/view.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
}
