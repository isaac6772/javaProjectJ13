package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		BoardVO vo = dao.getBoardContent(idx);
		ArrayList<BoardReplyVO> vos = dao.getBoardReply(idx);
		
		request.setAttribute("vo", vo);
		request.setAttribute("vos", vos);
	}

}
