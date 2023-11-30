package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLeaveCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		int res = 0;
		res = dao.setMemberLeave(mid);
		
		if(res == 1) {
			session.invalidate();
			request.setAttribute("msg", "회원탈퇴 되었습니다");
			request.setAttribute("url", "main.mem");
		}
		else {
			request.setAttribute("msg", "회원탈퇴 실패");
			request.setAttribute("url", "myInfo.mem");
		}
	}

}
