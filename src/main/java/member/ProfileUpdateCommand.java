package member;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProfileUpdateCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/profile");
		int maxSize = 1024 * 1024 * 5;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String fileSystemName = multipartRequest.getFilesystemName("file");
		
		if(fileSystemName.equals("") || fileSystemName == null) {
			request.setAttribute("msg", "업로드 실패");
		}
		else {
			// 업로드가 잘 되었다면 DB에 업로드 파일이름을 업데이트 시킨다.
			MemberDAO dao = new MemberDAO();
			HttpSession session = request.getSession();
			String mid = (String)session.getAttribute("sMid");
			MemberVO vo = dao.getMemberMidCheck(mid);
			String oldProfile = "/" + vo.getProfile();
			int res = 0;
			res = dao.setMemberUpdate(mid,fileSystemName,"profile");
			// DB에 업로드가 잘 되었다면 session을 변경시키고 이전 프로필 사진을 서버에서 제거시킨다.
			if(res == 1) {
				session.setAttribute("sProfile", fileSystemName);
				File file = new File(realPath + oldProfile);
				if(file.exists()) file.delete();
			}
		}
		request.setAttribute("url", "myInfo.mem");
	}

}
