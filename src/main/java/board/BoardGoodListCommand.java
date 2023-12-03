package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardGoodListCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		int pageSize = request.getParameter("pageSize") == null ? 20 : Integer.parseInt(request.getParameter("pageSize"));
		
		int totRecCnt = dao.getGoodRecCnt();
		int totPage = (totRecCnt%pageSize) == 0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize) + 1;
		int startIndexNo = (page - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int curBlock = (page - 1) / 5;
		int lastBlock = (totPage - 1) / 5;
		
		ArrayList<BoardVO> vos = dao.getBoardList(startIndexNo, pageSize, "인기글");
		
		request.setAttribute("page", page);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startIndexNo", startIndexNo);
		request.setAttribute("curScrStartNo", curScrStartNo);
		request.setAttribute("blockSize", 5);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("vos", vos);
	}

}
