package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PhoneUpdateCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		String phone = request.getParameter("phone") == null ? "" : request.getParameter("phone");
		
		MemberDAO dao = new MemberDAO();
		
		int res = 0;
		res = dao.setMemberUpdate(mid, phone, "phone");
		
		response.getWriter().write(res + "");
	}

}
