package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.RecommendVO;
import common.ViewRecommendDAO;
import common.ViewsVO;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int memberIdx = session.getAttribute("sIdx") == null ? 0 : (int)session.getAttribute("sIdx");
		int boardIdx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ViewRecommendDAO vDao = new ViewRecommendDAO();
		ViewsVO vVo = new ViewsVO();
		vVo.setMemberIdx(memberIdx);
		vVo.setBoardType("자유게시판");
		vVo.setBoardIdx(boardIdx);
		boolean check = vDao.getViewCheck(vVo);						// 게시물 조회수 증가시켜도 되는지 체크
		
		RecommendVO rVo = vDao.getGoodBadCheck(memberIdx,boardIdx);
		int flag;
		// 데이터가 없다는건 추천&비추천 내역이 없다는 뜻이므로 flag는 0이다.
		if(rVo.getBoardType() != null) flag = rVo.getFlag();
		else flag = 0;
		
		BoardDAO dao = new BoardDAO();
		if(check) dao.setViewNum(boardIdx);							// 게시물 조회수 증가시키기
		BoardVO vo = dao.getBoardContent(boardIdx);					// 게시물 가져오기
		ArrayList<BoardReplyVO> vos = dao.getBoardReply(boardIdx);	// 댓글 가져오기
		
		request.setAttribute("bVo", vo);
		request.setAttribute("vos", vos);
		request.setAttribute("goodBad", flag);
	}
}
