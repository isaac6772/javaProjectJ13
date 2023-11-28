package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class AdminController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "WEN-INF/admin";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		/*
		if(com.equals("/main")) {
			command = new MainCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/main/main.jsp";
		}
		*/
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
