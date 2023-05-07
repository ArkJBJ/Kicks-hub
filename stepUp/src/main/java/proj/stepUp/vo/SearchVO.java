package proj.stepUp.vo;

import proj.stepUp.util.PagingUtil;

public class SearchVO extends PagingUtil {
	private String searchType;
	private String searchValue;
	private String sort;
	private String statusShow;
	private int[] sizeKind;
	private int priceMin;
	private int priceMax;
	private String[] prdType;
	private int userIndex;
	private String pageType;
	
	
	public String getPageType() {
		return pageType;
	}
	public void setPageType(String pageType) {
		this.pageType = pageType;
	}
	public String getStatusShow() {
		return statusShow;
	}
	public void setStatusShow(String statusShow) {
		this.statusShow = statusShow;
	}
	public int getUserIndex() {
		return userIndex;
	}
	public void setUserIndex(int userIndex) {
		this.userIndex = userIndex;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int[] getSizeKind() {
		return sizeKind;
	}
	public void setSizeKind(int[] sizeKind) {
		this.sizeKind = sizeKind;
	}

	public String[] getPrdType() {
		return prdType;
	}
	public void setPrdType(String[] prdType) {
		this.prdType = prdType;
	}
	public String getSearchType() {
		return searchType;
	}
	public int getPriceMin() {
		return priceMin;
	}
	public void setPriceMin(int priceMin) {
		this.priceMin = priceMin;
	}
	public int getPriceMax() {
		return priceMax;
	}
	public void setPriceMax(int priceMax) {
		this.priceMax = priceMax;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}	
	
}
