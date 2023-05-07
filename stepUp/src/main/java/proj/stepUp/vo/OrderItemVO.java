package proj.stepUp.vo;

public class OrderItemVO extends SizeVO {
	private int orderItemIndex;
	private int sizeIndex;
	private int orderIndex;
	private int orderItemStock;
	
	public int getOrderItemIndex() {
		return orderItemIndex;
	}
	public void setOrderItemIndex(int orderItemIndex) {
		this.orderItemIndex = orderItemIndex;
	}
	public int getSizeIndex() {
		return sizeIndex;
	}
	public void setSizeIndex(int sizeIndex) {
		this.sizeIndex = sizeIndex;
	}
	public int getOrderIndex() {
		return orderIndex;
	}
	public void setOrderIndex(int orderIndex) {
		this.orderIndex = orderIndex;
	}
	public int getOrderItemStock() {
		return orderItemStock;
	}
	public void setOrderItemStock(int orderItemStock) {
		this.orderItemStock = orderItemStock;
	}
	
	
}
