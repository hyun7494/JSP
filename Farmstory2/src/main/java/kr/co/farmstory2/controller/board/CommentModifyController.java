package kr.co.farmstory2.controller.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory2.dao.ArticleDAO;

@WebServlet("/board/commentModify.do")
public class CommentModifyController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/commentModify.jsp");
		dispatcher.forward(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String no 	   = req.getParameter("no");
	 	String content = req.getParameter("content");
	 	
	 	int result = ArticleDAO.getInstance().updateComment(no, content);
	 	
	 	//JSON 출력
	 	JsonObject json = new JsonObject();
	 	json.addProperty("result", result);
	 	json.addProperty("no", no);
	 	json.addProperty("content", content);
	
	 	PrintWriter writer = resp.getWriter();
	 	writer.print(json.toString());
	}

}