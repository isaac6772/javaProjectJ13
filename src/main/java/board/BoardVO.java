package board;

public class BoardVO {
	private int idx;
	private String nickName;
	private int memberIdx;
	private String title;
	private String content;
	private String fName;
	private String fSName;
	private int viewNum;
	private int good;
	private int bad;
	private String boardType;
	private String writeDate;
	
	private int replyCnt;
	private int memberLevel;
	private String dateDiff;
	private String hourDiff;
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
	}
	public int getViewNum() {
		return viewNum;
	}
	public void setViewNum(int viewNum) {
		this.viewNum = viewNum;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getBad() {
		return bad;
	}
	public void setBad(int bad) {
		this.bad = bad;
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
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}
	public String getDateDiff() {
		return dateDiff;
	}
	public void setDateDiff(String dateDiff) {
		this.dateDiff = dateDiff;
	}
	public String getHourDiff() {
		return hourDiff;
	}
	public void setHourDiff(String hourDiff) {
		this.hourDiff = hourDiff;
	}
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", nickName=" + nickName + ", memberIdx=" + memberIdx + ", title=" + title
				+ ", content=" + content + ", fName=" + fName + ", fSName=" + fSName + ", viewNum=" + viewNum
				+ ", good=" + good + ", bad=" + bad + ", boardType=" + boardType + ", writeDate=" + writeDate
				+ ", replyCnt=" + replyCnt + ", memberLevel=" + memberLevel + ", dateDiff=" + dateDiff + ", hourDiff="
				+ hourDiff + "]";
	}
}
