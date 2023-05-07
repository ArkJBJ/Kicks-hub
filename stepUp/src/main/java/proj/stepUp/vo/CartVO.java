package proj.stepUp.vo;


public class CartVO {
	private int cartIndex;
	private int cartStock;			//카트개수
	private int userIndex;			//유저정보
	private int sizeIndex;			//사이즈 정보
	private String prdRname;		//제품이미지
	private String prdName;			//제품명
	private int prdPrice;			//제품가격
	private int sizeKind;			//사이즈 크기
	private int prdIndex;
	private int sizeStock;
	private String prdCode;
	
	public int getSizeStock() {
		return sizeStock;
	}
	public void setSizeStock(int sizeStock) {
		this.sizeStock = sizeStock;
	}
	public int getPrdIndex() {
		return prdIndex;
	}
	public void setPrdIndex(int prdIndex) {
		this.prdIndex = prdIndex;
	}
	public int getCartIndex() {
		return cartIndex;
	}
	public void setCartIndex(int cartIndex) {
		this.cartIndex = cartIndex;
	}
	public int getCartStock() {
		return cartStock;
	}
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	public int getUserIndex() {
		return userIndex;
	}
	public void setUserIndex(int userIndex) {
		this.userIndex = userIndex;
	}
	public int getSizeIndex() {
		return sizeIndex;
	}
	public void setSizeIndex(int sizeIndex) {
		this.sizeIndex = sizeIndex;
	}
	public String getPrdRname() {
		return prdRname;
	}
	public void setPrdRname(String prdRname) {
		this.prdRname = prdRname;
	}
	public String getPrdName() {
		return prdName;
	}
	public void setPrdName(String prdName) {
		this.prdName = prdName;
	}
	public int getPrdPrice() {
		return prdPrice;
	}
	public void setPrdPrice(int prdPrice) {
		this.prdPrice = prdPrice;
	}
	public int getSizeKind() {
		return sizeKind;
	}
	public void setSizeKind(int sizeKind) {
		this.sizeKind = sizeKind;
	}
	public String getPrdCode() {
		return prdCode;
	}
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
	}


}
