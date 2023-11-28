package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class JoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String phone = request.getParameter("phone") == null ? "" : request.getParameter("phone");
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		
		// 백엔드 유효성 체크(정규식, 아이디 중복검사)
		String regMid = "^[a-zA-Z0-9]{4,15}$";
		String regPwd = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()_\\-+=\\|\\]\\[}{;:/?.>,<\"'])[\\w\"'`~!@#$%^&*()_\\-+=\\|\\]\\[}{;:/?.>,<]{4,15}$";
		String regNickName = "^^[a-zA-Z0-9가-힣]{2,15}$$";
		String regName = "^[가-힣]{1,20}$";
		String regPhone = "^[0-9]{9,11}$";
		String regGender = "^(남자|여자)$";
		
		// 정규식 검사
		if(!mid.matches(regMid) || !pwd.matches(regPwd) || !nickName.matches(regNickName) || !name.matches(regName) 
				|| !phone.matches(regPhone) || !gender.matches(regGender)) {
			request.setAttribute("msg", "회원가입실패");
			request.setAttribute("url", "main.mem");
			return;
		}
		
		// 아이디 닉네임 중복검사
		if(dao.getMemberMidCheck(mid).getMid() != null || dao.getMemberNickCheck(nickName).getNickName() != null) {
			request.setAttribute("msg", "회원가입실패");
			request.setAttribute("url", "main.mem");
			return;
		}
		
		// 비밀번호 암호화
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		MemberVO vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setGender(gender);
		
		int res = 0;
		res = dao.setMemberJoin(vo);
		
		if(res != 0) request.setAttribute("msg", nickName + "님 회원가입을 축하합니다.");
		else request.setAttribute("msg", "회원가입실패");
		
		request.setAttribute("url", "main.mem");
	}
}
