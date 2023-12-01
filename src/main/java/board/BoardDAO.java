package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.MyConnect;

public class BoardDAO {
	private Connection conn = MyConnect.getInstance().conn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	BoardVO vo = null;
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (Exception e) {}
		}
	}
	
/*-------------------------------------------------------------------------------------------------------------------------*/
	
	// 게시물 등록
	public int setBoard(BoardVO vo) {
		int res = 0;
		
		try {
			sql = "insert into board1 values (default,?,?,?,?,?,?,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setInt(2, vo.getMemberIdx());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getfName());
			pstmt.setString(6, vo.getfSName());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 게시판 리스트 불러오기
	public ArrayList<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		
		try {
			sql = "select board1.*,member1.level,datediff(now(),writeDate) as dateDiff, timestampdiff(hour,writeDate,now()) as hourDiff "
					+ "from board1 join member1 on board1.memberIdx = member1.idx order by board1.idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setMemberIdx(rs.getInt("memberIdx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setViewNum(rs.getInt("viewNum"));
				vo.setGood(rs.getInt("good"));
				vo.setBad(rs.getInt("bad"));
				vo.setBoardType(rs.getString("boardType"));
				vo.setWriteDate(rs.getString("writeDate"));
				vo.setMemberLevel(rs.getInt("level"));
				vo.setDateDiff(rs.getString("dateDiff"));
				vo.setHourDiff(rs.getString("hourDiff"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// 레코드 수
	public int getTotRecCnt() {
		int res = 0;
		
		try {
			sql = "select count(*) as cnt from board1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) res = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}
	
}
