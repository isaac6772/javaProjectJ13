package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardDeleteCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardDelete(idx);
		
		if(res == 1) request.setAttribute("msg", "게시물이 삭제되었습니다.");
		else request.setAttribute("msg", "게시물 삭제 실패");
		request.setAttribute("url", "boardList.bo");
	}

}
