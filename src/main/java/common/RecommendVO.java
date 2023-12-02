package common;

public class RecommendVO {
	private int idx;
	private String boardType;
	private int boardIdx;
	private int memberIdx;
	private int flag;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public int getBoardIdx() {
		return boardIdx;
	}
	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "RecommendVO [idx=" + idx + ", boardType=" + boardType + ", boardIdx=" + boardIdx + ", memberIdx="
				+ memberIdx + ", flag=" + flag + "]";
	}
}
