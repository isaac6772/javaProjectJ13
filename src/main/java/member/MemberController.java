package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 0 : (int)session.getAttribute("sLevel");
		
		// 메인화면 이동
		if(com.equals("/main")) {
			command = new MainCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/main/main.jsp";
		}
		// 로그인 처리
		else if(com.equals("/loginOk")) {
			command = new LoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
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
		else if(level == 0) {	// level 0 은 비회원
			viewPage = "/WEB-INF/main/main.jsp";
		}
/*---------- 아래는 회원전용 -------------------------------------------------------------------------------------*/
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
		// 비밀번호 확인하기
		else if(com.equals("/pwdCheck")) {
			command = new PwdCheckCommand();
			command.execute(request, response);
			return;
		}
		// 비밀번호 변경하기
		else if(com.equals("/pwdChange")) {
			command = new PwdChangeCommand();
			command.execute(request, response);
			return;
		}
		// 회원 탈퇴 하기
		else if(com.equals("/memberLeave")) {
			command = new MemberLeaveCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		// 회원 정보 조회
		else if(com.equals("/memberInfo")) {
			command = new MemberInfoCommand();
			command.execute(request, response);
			viewPage += "/memberInfo.jsp";
		}
		// 회원 정보 조회
		else if(com.equals("/userInfoChange")) {
			command = new UserInfoChangeCommand();
			command.execute(request, response);
			return;
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
