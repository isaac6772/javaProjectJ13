package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NickCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getMemberNickCheck(nickName);
		
		if(vo.getNickName() != null) {
			response.getWriter().write("0");
		}
		else {
			response.getWriter().write("1");
		}
	}

}
