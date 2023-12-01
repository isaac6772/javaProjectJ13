package board;

public class BoardReplyVO {
	private int idx;
	private String nickName;
	private int memberIdx;
	private int boardIdx;
	private String content;
	private String boardType;
	private String writeDate;
	private int changeCheck;
	
	private String memberProfile;
	private int memberLevel;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getChangeCheck() {
		return changeCheck;
	}
	public void setChangeCheck(int changeCheck) {
		this.changeCheck = changeCheck;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	public int getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}
	@Override
	public String toString() {
		return "BoardReplyVO [idx=" + idx + ", nickName=" + nickName + ", memberIdx=" + memberIdx + ", boardIdx="
				+ boardIdx + ", content=" + content + ", boardType=" + boardType + ", writeDate=" + writeDate
				+ ", changeCheck=" + changeCheck + ", memberProfile=" + memberProfile + ", memberLevel=" + memberLevel
				+ "]";
	}
	
}
