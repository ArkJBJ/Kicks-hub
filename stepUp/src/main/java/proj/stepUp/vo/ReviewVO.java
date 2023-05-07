package proj.stepUp.vo;

public class ReviewVO extends ProductVO{
	private int reviewIndex;
	private String reviewContent;
	private String reviewDate;
	private int reviewScore;
	private int userIndex;
	private int prdIndex;
	private String userNick;
	private int start;
	private int perPage;
			
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public int getReviewIndex() {
		return reviewIndex;
	}
	public void setReviewIndex(int reviewIndex) {
		this.reviewIndex = reviewIndex;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
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
