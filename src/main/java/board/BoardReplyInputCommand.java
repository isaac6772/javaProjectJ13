package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardReplyInputCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardIdx = request.getParameter("boardIdx") == null ? 0 : Integer.parseInt(request.getParameter("boardIdx"));
		int memberIdx = request.getParameter("memberIdx") == null ? 0 : Integer.parseInt(request.getParameter("memberIdx"));
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		content = content.replace("<", "&lt;");
		content = content.replace(">", "&gt;");
		
		BoardReplyVO vo = new BoardReplyVO();
		vo.setBoardIdx(boardIdx);
		vo.setMemberIdx(memberIdx);
		vo.setContent(content);
		vo.setNickName(nickName);
		
		BoardDAO dao = new BoardDAO();
		int res = dao.setBoardReply(vo);
		
		response.getWriter().write(res + "");
	}
}
