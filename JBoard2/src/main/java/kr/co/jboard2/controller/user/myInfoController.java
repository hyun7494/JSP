package kr.co.jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.dao.UserDAO;
import kr.co.jboard2.vo.UserVO;



@WebServlet("/user/myInfo.do")
public class myInfoController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public void init() throws ServletException {
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid = req.getParameter("uid");
		String pass = req.getParameter("pass");
		UserVO vo = UserDAO.getInstance().selectUser(uid, pass);
		
		req.setAttribute("vo", vo);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user/myInfo.jsp");
		dispatcher.forward(req, resp);

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String name  = req.getParameter("name");
		String nick = req.getParameter("nick");
		String email   = req.getParameter("email");
		String hp  = req.getParameter("hp");
		String regip = req.getParameter("regip");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		
		UserVO vo = new UserVO();
		vo.setName(name);
		vo.setNick(nick);
		vo.setEmail(email);
		vo.setHp(hp);
		vo.setRegip(regip);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		
		
		UserDAO.getInstance().updateUser(vo);
		
		// 리다이렉트
		resp.sendRedirect("/JBoard2/list.do");
	}
}
