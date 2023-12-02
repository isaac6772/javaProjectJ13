package common;

public class ViewsVO {
	private int idx;
	private String boardType;
	private int boardIdx;
	private int memberIdx;
	private String viewDate;
	
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
	public String getViewDate() {
		return viewDate;
	}
	public void setViewDate(String viewDate) {
		this.viewDate = viewDate;
	}
	@Override
	public String toString() {
		return "ViewsVO [idx=" + idx + ", boardType=" + boardType + ", boardIdx=" + boardIdx + ", memberIdx="
				+ memberIdx + ", viewDate=" + viewDate + "]";
	}
	
}
