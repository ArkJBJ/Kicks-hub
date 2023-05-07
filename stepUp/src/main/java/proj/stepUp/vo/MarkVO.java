package proj.stepUp.vo;

public class MarkVO extends ProductVO{
	private int markIndex;
	private int userIndex;
	private int prdIndex;
	
	public MarkVO() {};
	
	public MarkVO(int total, int nowPage, int perPage) {
		super(total,nowPage,perPage);
	}
	
	public int getMarkIndex() {
		return markIndex;
	}
	public void setMarkIndex(int markIndex) {
		this.markIndex = markIndex;
	}
	public int getUserIndex() {
		return userIndex;
	}
	public void setUserIndex(int userIndex) {
		this.userIndex = userIndex;
	}
	public int getPrdIndex() {
		return prdIndex;
	}
	public void setPrdIndex(int prdIndex) {
		this.prdIndex = prdIndex;
	}
	
	
}
