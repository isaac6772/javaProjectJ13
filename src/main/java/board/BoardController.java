package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInterface command = null;
		String viewPage = "WEB-INF/board";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 88 : (int)session.getAttribute("sLevel");
		
		if(com.equals("/board")) {
			viewPage += "/board.jsp";
		}
		/*
		else if(level < 2) {
			command = new AccessDenied();
			return;
		}
		*/
		else if(com.equals("/boardWrite")) {
			viewPage += "/boardWrite.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
