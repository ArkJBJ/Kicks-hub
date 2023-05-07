package proj.stepUp.vo;

public class QnaVO extends UserVO{
	private int qnaIndex;
	private String qnaTitle;
	private String qnaCnt;
	private String qnaWdate;
	private int total;
	private String qnaRsp;

	
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaCnt() {
		return qnaCnt;
	}
	public void setQnaCnt(String qnaCnt) {
		this.qnaCnt = qnaCnt;
	}
	public String getQnaWdate() {
		return qnaWdate;
	}
	public void setQnaWdate(String qnaWdate) {
		this.qnaWdate = qnaWdate;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getQnaIndex() {
		return qnaIndex;
	}
	public void setQnaIndex(int qnaIndex) {
		this.qnaIndex = qnaIndex;
	}
	public String getQnaRsp() {
		return qnaRsp;
	}
	public void setQnaRsp(String qnaRsp) {
		this.qnaRsp = qnaRsp;
	}
	
}
