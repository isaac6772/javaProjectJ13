package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserInfoChangeCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int idx = session.getAttribute("sIdx") == null ? 0 : (int)session.getAttribute("sIdx");
		String userInfo = request.getParameter("userInfo") == null ? "n" : request.getParameter("userInfo");
		
		MemberDAO dao = new MemberDAO();
		dao.setMemberUserInfo(idx,userInfo);
	}
}
