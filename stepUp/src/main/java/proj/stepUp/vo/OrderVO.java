package proj.stepUp.vo;

public class OrderVO extends UserVO {
	private int orderIndex;
	private String orderDate;
	private String orderAddr;
	private String orderPost;
	private String orderPhone;
	private int orderTotalPrice;
	private String orderPay;
	private int userIndex;
	private String orderNum;
	private String orderStatus;
	private String orderName;
	private String orderBuyerName;
		
	public String getOrderBuyerName() {
		return orderBuyerName;
	}
	public void setOrderBuyerName(String orderBuyerName) {
		this.orderBuyerName = orderBuyerName;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderPost() {
		return orderPost;
	}
	public void setOrderPost(String orderPost) {
		this.orderPost = orderPost;
	}
	public int getOrderIndex() {
		return orderIndex;
	}
	public void setOrderIndex(int orderIndex) {
		this.orderIndex = orderIndex;
	}
	public String getOrderAddr() {
		return orderAddr;
	}
	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}
	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}
	public String getOrderPay() {
		return orderPay;
	}
	public void setOrderPay(String orderPay) {
		this.orderPay = orderPay;
	}
	public int getUserIndex() {
		return userIndex;
	}
	public void setUserIndex(int userIndex) {
		this.userIndex = userIndex;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	
	
}
