package proj.stepUp.vo;

import proj.stepUp.util.PagingUtil;

public class ProductVO extends PagingUtil {
	private int prdIndex;
	private String prdCode;
	private String prdName;
	private int prdPrice;
	private String prdDate;
	private String prdOname;
	private String prdRname;
	private String prdCnt;
	private String prdMadeIn;
	private String prdMt;
	private String prdQc;
	private String prdCare;
	private String prdMadeDate;
	private int prdSales;
	private String prdDel;
	
	public ProductVO() {};
	
	public ProductVO(int total, int nowPage, int perPage) {
		super(total,nowPage,perPage);
	}
	
	public String getPrdDel() {
		return prdDel;
	}
	public void setPrdDel(String prdDel) {
		this.prdDel = prdDel;
	}
	public int getPrdSales() {
		return prdSales;
	}
	public void setPrdSales(int prdSales) {
		this.prdSales = prdSales;
	}
	public int getPrdIndex() {
		return prdIndex;
	}
	public void setPrdIndex(int prdIndex) {
		this.prdIndex = prdIndex;
	}
	public String getPrdCode() {
		return prdCode;
	}
	public void setPrdCode(String prdCode) {
		this.prdCode = prdCode;
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
	public String getPrdDate() {
		return prdDate;
	}
	public void setPrdDate(String prdDate) {
		this.prdDate = prdDate;
	}
	public String getPrdOname() {
		return prdOname;
	}
	public void setPrdOname(String prdOname) {
		this.prdOname = prdOname;
	}
	public String getPrdRname() {
		return prdRname;
	}
	public void setPrdRname(String prdRname) {
		this.prdRname = prdRname;
	}
	public String getPrdCnt() {
		return prdCnt;
	}
	public void setPrdCnt(String prdCnt) {
		this.prdCnt = prdCnt;
	}
	public String getPrdMadeIn() {
		return prdMadeIn;
	}
	public void setPrdMadeIn(String prdMadeIn) {
		this.prdMadeIn = prdMadeIn;
	}
	public String getPrdMt() {
		return prdMt;
	}
	public void setPrdMt(String prdMt) {
		this.prdMt = prdMt;
	}
	public String getPrdQc() {
		return prdQc;
	}
	public void setPrdQc(String prdQc) {
		this.prdQc = prdQc;
	}
	public String getPrdCare() {
		return prdCare;
	}
	public void setPrdCare(String prdCare) {
		this.prdCare = prdCare;
	}
	public String getPrdMadeDate() {
		return prdMadeDate;
	}
	public void setPrdMadeDate(String prdMadeDate) {
		this.prdMadeDate = prdMadeDate;
	}
	
	
}
