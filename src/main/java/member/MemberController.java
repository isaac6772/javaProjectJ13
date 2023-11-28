package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		if(com.equals("/main")) {
			command = new MainCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/main/main.jsp";
		}
		// 아이디중복체크
		else if(com.equals("/idCheck")) {
			command = new IdCheckCommand();
			command.execute(request, response);
			return;
		}
		// 닉네임중복체크
		else if(com.equals("/nickCheck")) {
			command = new NickCheckCommand();
			command.execute(request, response);
			return;
		}
		// 프론트에서 유효성 검사후 회원가입 하기
		else if(com.equals("/joinOk")) {
			command = new JoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/loginOk")) {
			command = new LoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/logoutOk")) {
			command = new LogoutOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
