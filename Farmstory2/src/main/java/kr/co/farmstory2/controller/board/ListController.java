package kr.co.farmstory2.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.vo.ArticleVO;


@WebServlet("/board/list.do")
public class ListController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 그룹과 카테고리 연결
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
		// list
		String pg = req.getParameter("pg");
		String search = req.getParameter("search");
		

		// 현재 페이지 번호
		int currentPage = service.getCurrentPage(pg);
				
		// 전체 게시물 갯수 
		int total = service.selectCountTotal(search, cate);
		
		// 마지막 페이지 번호
		int lastPageNum = service.getLastPageNum(total);
		
		// 페이지 그룹 start, end 번호
		int[] result = service.getPageGroupNum(currentPage, lastPageNum);
		
		// 페이지 시작번호
		int pageStartNum = service.getPageStartNum(total, currentPage);
		
		// 시작 인덱스
		int start = service.getStartNum(currentPage);
		
		// 글 가져오기
		List<ArticleVO> articles = service.selectArticles(cate, start);
		
		// 카테고리별 View를 위한 request Scope 데이터 설정
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		// View에서 데이터 출력을 위한 request Scope 데이터 설정
		req.setAttribute("pg", pg);
		req.setAttribute("articles", articles);
		req.setAttribute("lastPageNum", lastPageNum);		
		req.setAttribute("currentPage", currentPage);		
		req.setAttribute("pageGroupStart", result[0]);
		req.setAttribute("pageGroupEnd", result[1]);
		req.setAttribute("pageStartNum", pageStartNum+1);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/list.jsp");
		dispatcher.forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	}

}