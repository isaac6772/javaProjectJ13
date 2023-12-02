package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardUpdateOkCommand implements BoardInterface {

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
		int idx = multipartRequest.getParameter("idx") == null ? 0 : Integer.parseInt(multipartRequest.getParameter("idx"));
		int flag = multipartRequest.getParameter("flag") == null ? 0 : Integer.parseInt(multipartRequest.getParameter("flag"));
		title = title.replace("<", "&lt;");
		title = title.replace(">", "&gt;");
		content = content.replace("<", "&lt;");
		content = content.replace(">", "&gt;");
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoardContent(idx);
		vo.setTitle(title);
		vo.setContent(content);
		// 기존 파일이 넘어오지 않았을때
		if(flag!=1) {
			vo.setfName(fName);
			vo.setfSName(fSName);
		}
		// 닉네임은 변경가능하므로 게시물을 수정한다면 게시물에 저장된 기존 닉네임이 아니라 현재 사용중인 닉네임이 저장된다.
		HttpSession session = request.getSession();
		String nickName = (String)session.getAttribute("sNickName");
		vo.setNickName(nickName);
		
		int res = dao.setBoardUpdate(vo);
		
		if(res == 1) request.setAttribute("msg", "게시물이 수정되었습니다.");
		else request.setAttribute("msg", "게시물 수정에 실패하였습니다.");
		
		request.setAttribute("url", "boardContent.bo?idx=" + idx);
	}
}
