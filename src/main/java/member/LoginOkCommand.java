package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class LoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemberMidCheck(mid);
		
		if(vo.getMid() == null) {
			request.setAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다.");
		}
		else if (!vo.getPwd().equals(pwd)) {
			request.setAttribute("msg", "아이디 또는 비밀번호를 잘못 입력했습니다.");
		}
		// 유효성 검사를 모두 마친 후 로그인 관련 작업 처리
		else {
			HttpSession session = request.getSession();
			session.setAttribute("sMidx", vo.getIdx());
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			session.setAttribute("sProfile", vo.getProfile());
			session.setAttribute("sLevel", vo.getLevel());
			
			String strLevel = "";
			if(vo.getLevel() == 0) strLevel = "관리자";
			else if(vo.getLevel() == 1) strLevel = "준회원";
			else if(vo.getLevel() == 2) strLevel = "우수회원";
			
			session.setAttribute("strLevel", strLevel);
		}
		request.setAttribute("url", "main.mem");
	}
}
