package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "WEB-INF/admin";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 0 : (int)session.getAttribute("sLevel");
		
		if(level != 77) {
			request.getRequestDispatcher("/").forward(request, response);
		}
		else if(com.equals("/informWrite")) {
			viewPage += "/informWrite.jsp";
		}
		else if(com.equals("/informWriteOk")) {
			command = new InformWriteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
