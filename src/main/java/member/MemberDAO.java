package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.MyConnect;

public class MemberDAO {
	private Connection conn = MyConnect.getInstance().conn;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	MemberVO vo = null;
	
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
	
	// 멤버 아이디 중복 체크
	public MemberVO getMemberMidCheck(String mid) {
		MemberVO vo = new MemberVO();
		
		try {
			sql = "select * from member1 where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setGender(rs.getString("gender"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setPoint(rs.getInt("point"));
				vo.setJoinDate(rs.getString("joinDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setProfile(rs.getString("profile"));
				vo.setUserInfo(rs.getString("userInfo"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	public MemberVO getMemberNickCheck(String nickName) {
		MemberVO vo = new MemberVO();
		
		try {
			sql = "select * from member1 where nickName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setPhone(rs.getString("phone"));
				vo.setGender(rs.getString("phone"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setPoint(rs.getInt("point"));
				vo.setJoinDate(rs.getString("joinDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setProfile(rs.getString("profile"));
				vo.setUserInfo(rs.getString("userInfo"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	// 회원가입 신청
	public int setMemberJoin(MemberVO vo) {
		int res = 0;
		
		try {
			sql = "insert into member1 values (default,?,?,?,?,?,?,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getPhone());
			pstmt.setString(6, vo.getGender());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
	// 회원 닉네임 수정
	public int setMemberNickChange(String mid, String nickName) {
		int res = 0;
		
		try {
			sql = "update member1 set nickName = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickName);
			pstmt.setString(2, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	
}
