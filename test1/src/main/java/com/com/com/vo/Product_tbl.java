package com.com.com.vo;

public class Product_tbl {
	private int num;
	private String name;
	private String cnt;
	private String remark;
	private String yn;
	private String total;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getYn() {
		return yn;
	}
	public void setYn(String yn) {
		this.yn = yn;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "Product_tbl [num=" + num + ", name=" + name + ", cnt=" + cnt + ", remark=" + remark + ", yn=" + yn
				+ ", total=" + total + "]";
	}
	
	
}
