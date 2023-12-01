package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/board");
		int maxSize = 1024 * 1024 * 10;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String fName = multipartRequest.getOriginalFileName("file");
		String fSName = multipartRequest.getFilesystemName("file");
		String title = multipartRequest.getParameter("title") == null ? "" : multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content") == null ? "" : multipartRequest.getParameter("content");
		
		HttpSession session = request.getSession();
		int memberIdx = (int)session.getAttribute("sIdx");
		String nickName = (String)session.getAttribute("sNickName");
		
		BoardVO vo = new BoardVO();
		vo.setNickName(nickName);
		vo.setMemberIdx(memberIdx);
		vo.setTitle(title);
		vo.setContent(content);
		if(fName != null) {
			vo.setfName(fName);
			vo.setfSName(fSName);
		}
		BoardDAO dao = new BoardDAO();
		int res = 0;
		res = dao.setBoard(vo);
		
		if(res == 1) request.setAttribute("msg", "게시물이 등록되었습니다.");
		else request.setAttribute("msg", "게시물 등록에 실패하였습니다.");
		
		request.setAttribute("url", "boardList.bo");
	}
}
