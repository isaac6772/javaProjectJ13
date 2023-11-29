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
		
		// 메인화면 이동
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
		// 로그인 처리
		else if(com.equals("/loginOk")) {
			command = new LoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		// 로그아웃 처리
		else if(com.equals("/logoutOk")) {
			command = new LogoutOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		// 내 정보 보기
		else if(com.equals("/myInfo")) {
			command = new MyInfoCommand();
			command.execute(request, response);
			viewPage += "/myInfo.jsp";
		}
		// 닉네임 변경하기
		else if(com.equals("/nickUpdate")) {
			command = new NickUpdateCommand();
			command.execute(request, response);
			return;
		}
		// 전화번호 변경하기
		else if(com.equals("/phoneUpdate")) {
			command = new PhoneUpdateCommand();
			command.execute(request, response);
			return;
		}
		// 이름 변경하기
		else if(com.equals("/nameUpdate")) {
			command = new NameUpdateCommand();
			command.execute(request, response);
			return;
		}
		// 프로필 변경하기(command에서 command로 가도되나..?)
		else if(com.equals("/profileUpdate")) {
			command = new ProfileUpdateCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
