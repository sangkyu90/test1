package com.com.com.dao;

import java.util.List;

import com.com.com.vo.ProductCompany;

public interface ProductCompanyDAO {
	public List <ProductCompany> getProductCompanyList(ProductCompany product);
	public ProductCompany  product(Integer COMPANY_CD);
	public int insertProductCompany(ProductCompany product);
	public int updateProductCompany(ProductCompany product);
	public int deleteProductCompany(Integer COMPANY_CD);
}
