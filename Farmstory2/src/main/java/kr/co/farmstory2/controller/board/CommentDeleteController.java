package kr.co.farmstory2.controller.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.farmstory2.dao.ArticleDAO;

@WebServlet("/board/commentDelete.do")
public class CommentDeleteController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no = req.getParameter("no");
		
		int result = ArticleDAO.getInstance().deleteComment(no);
		
		//JSON 출력
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		json.addProperty("no", no);
		
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}