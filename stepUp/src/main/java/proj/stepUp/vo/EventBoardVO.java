package proj.stepUp.vo;

public class EventBoardVO {
	private int eventIndex;
	private String eventCnt;
	private String eventTitle;
	private String eventWdate;
	private int eventHit;
	private int userIndex;
	private String userNick;
	private int total;
	
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	
	public int getEventIndex() {
		return eventIndex;
	}
	public void setEventIndex(int eventIndex) {
		this.eventIndex = eventIndex;
	}
	public String getEventCnt() {
		return eventCnt;
	}
	public void setEventCnt(String eventCnt) {
		this.eventCnt = eventCnt;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventWdate() {
		return eventWdate;
	}
	public void setEventWdate(String eventWdate) {
		this.eventWdate = eventWdate;
	}
	public int getEventHit() {
		return eventHit;
	}
	public void setEventHit(int eventHit) {
		this.eventHit = eventHit;
	}
	public int getUserIndex() {
		return userIndex;
	}
	public void setUserIndex(int userIndex) {
		this.userIndex = userIndex;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}

	

}


