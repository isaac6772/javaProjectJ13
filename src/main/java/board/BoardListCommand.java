package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardListCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		String search = request.getParameter("search") == null ? "" : request.getParameter("search"); 
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		int pageSize = request.getParameter("pageSize") == null ? 20 : Integer.parseInt(request.getParameter("pageSize"));
		
		int totRecCnt = dao.getTotRecCnt(search);
		int totPage = (totRecCnt%pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) + 1;
		int startIndexNo = (page - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int curBlock = (page - 1) / 5;
		int lastBlock = (totPage - 1) / 5;
		
		// 전체게시물은 3번째 매개변수에 공백을, 인기글은 3번째 매개변수에 문자열 'good'을 넘겨준다
		ArrayList<BoardVO> vos = dao.getBoardList(startIndexNo, pageSize, search);
		ArrayList<BoardVO> iVos = dao.getBoardList(startIndexNo, pageSize, "공지");
		
		request.setAttribute("search", search);
		request.setAttribute("page", page);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startIndexNo", startIndexNo);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", 5);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("vos", vos);
		request.setAttribute("iVos", iVos);
	}

}
