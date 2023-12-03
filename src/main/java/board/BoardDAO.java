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
			} catch (Exception e) {}
		}
		pstmtClose();
	}
	
/*-------------------------------------------------------------------------------------------------------------------------*/
	
	// 게시물 등록
	public int setBoard(BoardVO vo, String inform) {
		int res = 0;
		
		try {
			sql = "insert into board1 values (default,?,?,?,?,?,?,default,default,default,'일반',default)";
			if(inform != "") sql = "insert into board1 values (default,?,?,?,?,?,?,default,default,default,'공지',default)";
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
	public ArrayList<BoardVO> getBoardList(int startIndexNo, int pageSize, String parameter) {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		
		try {
			
			sql = "select board1.*,member1.level,count(boardReply.idx) as replyCnt, datediff(now(),board1.writeDate) as dateDiff, timestampdiff(hour,board1.writeDate,now()) as hourDiff "
					+ "from board1 join member1 on board1.memberIdx = member1.idx and (board1.title like '%"+parameter+"%' or board1.nickName like '%"+parameter+"%') left join boardReply on board1.idx = boardReply.boardIdx and boardReply.boardType = '자유게시판' group by board1.idx order by board1.idx desc "
					+ "limit ?,?";
			if(parameter.equals("인기글")) sql = "select board1.*,member1.level,count(boardReply.idx) as replyCnt, datediff(now(),board1.writeDate) as dateDiff, timestampdiff(hour,board1.writeDate,now()) as hourDiff "
					+ "from board1 join member1 on board1.memberIdx = member1.idx and board1.good >= 10 left join boardReply on board1.idx = boardReply.boardIdx and boardReply.boardType = '자유게시판' group by board1.idx order by board1.idx desc "
					+ "limit ?,?";
			else if(parameter.equals("공지")) sql = "select board1.*,member1.level,count(boardReply.idx) as replyCnt, datediff(now(),board1.writeDate) as dateDiff, timestampdiff(hour,board1.writeDate,now()) as hourDiff "
					+ "from board1 join member1 on board1.memberIdx = member1.idx and boardType = '공지' left join boardReply on board1.idx = boardReply.boardIdx and boardReply.boardType = '자유게시판' group by board1.idx order by board1.idx desc "
					+ "limit ?,?";
			
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
				
				vo.setReplyCnt(rs.getInt("replyCnt"));
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
	public int getTotRecCnt(String search) {
		int res = 0;
		
		try {
			sql = "select count(*) as cnt from board1";
			if(sql != "") sql = "select count(*) as cnt from board1 where title like '%"+search+"%' or nickName like '%"+search+"%'";
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
	
	// 개별 게시물 보기
	public BoardVO getBoardContent(int idx) {
		BoardVO vo = new BoardVO();
		
		try {
			sql = "select board1.*,member1.level,member1.profile from board1 join member1 on board1.memberIdx = member1.idx and board1.idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
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
				
				vo.setMemberProfile(rs.getString("profile"));
				vo.setMemberLevel(rs.getInt("level"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		
		return vo;
	}
	
	// 해당 게시물의 댓글 전체 불러오기
	public ArrayList<BoardReplyVO> getBoardReply(int idx) {
		ArrayList<BoardReplyVO> vos = new ArrayList<BoardReplyVO>();
		
		try {
			sql = "select boardReply.*,member1.profile,member1.level from boardReply join member1 on boardReply.memberIdx = member1.idx and boardReply.boardIdx = ? and boardReply.boardType = '자유게시판'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardReplyVO vo = new BoardReplyVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setMemberIdx(rs.getInt("memberIdx"));
				vo.setBoardIdx(rs.getInt("boardIdx"));
				vo.setContent(rs.getString("content"));
				vo.setBoardType(rs.getString("boardType"));
				vo.setWriteDate(rs.getString("writeDate"));
				vo.setChangeCheck(rs.getInt("changeCheck"));
				
				vo.setMemberProfile(rs.getString("profile"));
				vo.setMemberLevel(rs.getInt("level"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// 게시물에 댓글 등록하기
	public int setBoardReply(BoardReplyVO vo) {
		int res = 0;
		
		try {
			sql = "insert into boardReply values (default,?,?,?,?,'자유게시판',default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setInt(2, vo.getMemberIdx());
			pstmt.setInt(3, vo.getBoardIdx());
			pstmt.setString(4, vo.getContent());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 게시물 수정하기
	public int setBoardUpdate(BoardVO vo) {
		int res = 0;
		
		try {
			sql = "update board1 set title = ?, content = ?, nickName = ?, fName = ?, fSName = ?, writeDate = default where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getfName());
			pstmt.setString(5, vo.getfSName());
			pstmt.setInt(6, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 게시물 삭제하기
	public int setBoardDelete(int idx) {
		int res = 0;
		
		try {
			sql = "delete from board1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 게시물 조회수 증가
	public void setViewNum(int boardIdx) {
		try {
			sql = "update board1 set viewNum = viewNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardIdx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
	}
	
	// 게시물 추천&비추천 처리
	public void setBoardRecommend(int boardIdx, String goodBad, String num) {
		try {
			sql = "update board1 set "+goodBad+" = "+goodBad+" + "+num+" where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardIdx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
			e.printStackTrace();
		} finally {
			pstmtClose();
		}
	}
	
	// 인기글 레코드 수
	public int getGoodRecCnt() {
		int res = 0;
		
		try {
			sql = "select count(*) as cnt from board1 where good >= 10";
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
	
	// 공지사항 레코드수
	public int getInformRecCnt() {
		int res = 0;
		
		try {
			sql = "select count(*) as cnt from board1 where boardType = '공지'";
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
	
	// 댓글 삭제하기
	public int setDeleteReply(int idx) {
		int res = 0;
		
		try {
			sql = "delete from boardReply where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
}
