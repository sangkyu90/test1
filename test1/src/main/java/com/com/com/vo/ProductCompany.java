package com.com.com.vo;

public class ProductCompany {
	private Integer COMPANY_CD;
	private String COMPANY_NAME;
	private String REG_DATE;
	private String REMARK;
	private String DEL_YN;
	public Integer getCOMPANY_CD() {
		return COMPANY_CD;
	}
	public void setCOMPANY_CD(Integer cOMPANY_CD) {
		COMPANY_CD = cOMPANY_CD;
	}
	public String getCOMPANY_NAME() {
		return COMPANY_NAME;
	}
	public void setCOMPANY_NAME(String cOMPANY_NAME) {
		COMPANY_NAME = cOMPANY_NAME;
	}
	public String getREG_DATE() {
		return REG_DATE;
	}
	public void setREG_DATE(String rEG_DATE) {
		REG_DATE = rEG_DATE;
	}
	public String getREMARK() {
		return REMARK;
	}
	public void setREMARK(String rEMARK) {
		REMARK = rEMARK;
	}
	public String getDEL_YN() {
		return DEL_YN;
	}
	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}
	@Override
	public String toString() {
		return "ProductCompany [COMPANY_CD=" + COMPANY_CD + ", COMPANY_NAME=" + COMPANY_NAME + ", REG_DATE=" + REG_DATE
				+ ", REMARK=" + REMARK + ", DEL_YN=" + DEL_YN + "]";
	}
	
	
	

}
