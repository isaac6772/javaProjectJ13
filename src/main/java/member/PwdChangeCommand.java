package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class PwdChangeCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		
		String regPwd = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()_\\-+=\\|\\]\\[}{;:/?.>,<\"'])[\\w\"'`~!@#$%^&*()_\\-+=\\|\\]\\[}{;:/?.>,<]{4,15}$";
		
		int res = 0;
		if(pwd.matches(regPwd)) {
			SecurityUtil security = new SecurityUtil();
			pwd = security.encryptSHA256(pwd);
			MemberDAO dao = new MemberDAO();
			res = dao.setMemberUpdate(mid, pwd, "pwd");
		}
		response.getWriter().write(res + "");
	}
}
