package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInterface command = null;
		String viewPage = "WEB-INF/board";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 88 : (int)session.getAttribute("sLevel");
		
		// 자유게시판 이동하기
		if(com.equals("/boardList")) {
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage += "/boardList.jsp";
		}
		// 게시물 작성 페이지 이동
		else if(com.equals("/boardWrite")) {
			viewPage += "/boardWrite.jsp";
		}
		// 게시물 작성하기
		else if(com.equals("/boardWriteOk")) {
			command = new BoardWriteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		// 개별 게시물 페이지
		else if(com.equals("/boardContent")) {
			command = new BoardContentCommand();
			command.execute(request, response);
			viewPage += "/boardContent.jsp";
		}
		// 게시물에 댓글 쓰기
		else if(com.equals("/boardReplyInput")) {
			command = new BoardReplyInputCommand();
			command.execute(request, response);
			return;
		}
		// 게시물 수정 페이지로 이동
		else if(com.equals("/boardUpdate")) {
			command = new BoardUpdateCommand();
			command.execute(request, response);
			viewPage += "/boardUpdate.jsp";
		}
		// 게시물 수정
		else if(com.equals("/boardUpdateOk")) {
			command = new BoardUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		// 게시물 삭제
		else if(com.equals("/boardDelete")) {
			command = new BoardDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		// 게시물 추천&비추천 상태 가져오기
		else if(com.equals("/recommendUpdate")) {
			command = new RecommendUpdateCommand();
			command.execute(request, response);
			return;
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
