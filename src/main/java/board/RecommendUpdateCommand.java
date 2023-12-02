package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.RecommendVO;
import common.ViewRecommendDAO;

public class RecommendUpdateCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int flag = request.getParameter("flag") == null ? -1 : Integer.parseInt(request.getParameter("flag"));
		int boardIdx = request.getParameter("boardIdx") == null ? 0 : Integer.parseInt(request.getParameter("boardIdx"));
		int memberIdx = request.getParameter("memberIdx") == null ? 0 : Integer.parseInt(request.getParameter("memberIdx"));
		
		BoardDAO dao = new BoardDAO();
		ViewRecommendDAO vDao = new ViewRecommendDAO();
		
		RecommendVO vo = vDao.getGoodBadCheck(memberIdx,boardIdx);
		int check = 0;
		if(vo.getBoardType() != null) check = vo.getFlag();
		// 추천 혹은 비추천을 취소했을때
		if(flag == 0) {
			if(check == 1) dao.setBoardRecommend(boardIdx,"good","-1");
			else if(check == 2) dao.setBoardRecommend(boardIdx,"bad","-1");
			vDao.setDeleteRecommend(vo.getIdx());
		}
		// 추천했는데 기존에 이미 비추천이었거나 아무것도 안한 상태일때
		else if(flag == 1) {
			if(check == 0) {
				vDao.setRecommend(boardIdx,memberIdx,flag);
				dao.setBoardRecommend(boardIdx, "good", "1");
			}
			else if(check == 2) {
				dao.setBoardRecommend(boardIdx, "good", "1");
				dao.setBoardRecommend(boardIdx,"bad","-1");
				vDao.setRecommendUpdate(boardIdx,memberIdx,1);
			}
		}
		// 비추천했는데 기존에 이미 추천되어있거나 아무것도 안한 상태일때
		else if(flag == 2) {
			if(check == 0) {
				vDao.setRecommend(boardIdx,memberIdx,flag);
				dao.setBoardRecommend(boardIdx, "bad", "1");
			}
			else if(check == 1) {
				dao.setBoardRecommend(boardIdx, "bad", "1");
				dao.setBoardRecommend(boardIdx,"good","-1");
				vDao.setRecommendUpdate(boardIdx,memberIdx,2);
			}
		}
	}
}
