package com.nkshare.vo;

public class GoodsSearch {
	private String searchWord;
	private String goodsType;
	private String sortName;
	private String sortWay;
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}
	public String getSortName() {
		return sortName;
	}
	public void setSortName(String sortName) {
		this.sortName = sortName;
	}
	public String getSortWay() {
		return sortWay;
	}
	public void setSortWay(String sortWay) {
		this.sortWay = sortWay;
	}
	@Override
	public String toString() {
		return "GoodsSearch [searchWord=" + searchWord + ", goodsType=" + goodsType + ", sortName=" + sortName
				+ ", sortWay=" + sortWay + "]";
	}
}
