package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ViewRecommendDAO {
	Connection conn = MyConnect.getInstance().conn;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "";
	
	public void pstmtClose() {
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {}
		}
		pstmtClose();
	}
/*-------------------------------------------------------------------------------------------------------------------------*/
	
	// 조회수 증가할 수 있는지 체크
	public boolean getViewCheck(ViewsVO vo) {
		boolean check = false;
		
		try {
			sql = "select idx, datediff(now(),viewDate) as dateDiff from views where memberIdx = ? and boardType = ? and boardIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getMemberIdx());
			pstmt.setString(2, vo.getBoardType());
			pstmt.setInt(3, vo.getBoardIdx());
			rs = pstmt.executeQuery();
			// 해당 게시물에 조회한 이력이 없다면 조회테이블에 등록하고 해당 게시물 조회수 증가
			if(!rs.next()) {
				sql = "insert into views values (default,?,?,?,default)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getBoardType());
				pstmt.setInt(2, vo.getBoardIdx());
				pstmt.setInt(3, vo.getMemberIdx());
				int res = pstmt.executeUpdate();
				if(res==1) check = true;
			}
			// 해당 게시물에 조회한 이력이 있지만 날짜 차이가 있다면 수정하고 해당 게시물 조회수 증가
			else if(rs.getInt("dateDiff")>0) {
				sql = "update views set viewDate = default where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, rs.getInt("idx"));
				int res = pstmt.executeUpdate();
				if(res==1) check = true;
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return check;
	}
	
	// 추천 체크
	public RecommendVO getGoodBadCheck(int memberIdx, int boardIdx) {
		RecommendVO vo = new RecommendVO();
		
		try {
			sql = "select * from recommend where boardType = '자유게시판' and boardIdx = ? and memberIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardIdx);
			pstmt.setInt(2, memberIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setBoardType(rs.getString("boardType"));
				vo.setBoardIdx(rs.getInt("boardIdx"));
				vo.setMemberIdx(rs.getInt("memberIdx"));
				vo.setFlag(rs.getInt("flag"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// 추천 레코드 제거
	public void setDeleteRecommend(int idx) {
		try {
			sql = "delete from recommend where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	
	// 추천 레코드 생성
	public void setRecommend(int boardIdx, int memberIdx, int flag) {
		try {
			sql = "insert into recommend values(default,'자유게시판',?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardIdx);
			pstmt.setInt(2, memberIdx);
			pstmt.setInt(3, flag);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	
	// 추천 레코드 업데이트
	public void setRecommendUpdate(int boardIdx, int memberIdx, int flag) {
		try {
			sql = "update recommend set flag = ? where boardIdx = ? and memberIdx = ? and boardType = '자유게시판'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, flag);
			pstmt.setInt(2, boardIdx);
			pstmt.setInt(3, memberIdx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	
	
}
