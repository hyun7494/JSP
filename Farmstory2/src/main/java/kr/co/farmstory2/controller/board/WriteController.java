package kr.co.farmstory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.vo.ArticleVO;


@WebServlet("/board/write.do")
public class WriteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	@Override
	public void init() throws ServletException {
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 수신
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/write.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// multipart 전송 데이터 수신
		ServletContext application = req.getServletContext();
		String savePath = application.getRealPath("/file");
		
		MultipartRequest mr = service.uploadFile(req, savePath);
		
		String group	 = mr.getParameter("group");
		String cate		 = mr.getParameter("cate");
		String title	 = mr.getParameter("title");
		String content	 = mr.getParameter("content");
		String uid		 = mr.getParameter("uid");
		String fname	 = mr.getFilesystemName("fname");
		String regip	 = req.getRemoteAddr();
		
		ArticleVO article = new ArticleVO();
		article.setCate(cate);
		article.setTitle(title);
		article.setContent(content);
		article.setUid(uid);
		article.setFname(fname);
		article.setRegip(regip);
		
		int parent = service.insertArticle(article); // 파일의 글 번호
		
		
		// 파일을 첨부했으면 파일처리
		if(fname != null){
			// 파일명 수정
			String newName = service.renameFile(article, savePath);
			
			// 파일 테이블 저장
			service.insertFile(parent, newName, fname);
		}
		
		resp.sendRedirect("/Farmstory2/board/list.do?group="+group+"&cate="+cate);
	}
}