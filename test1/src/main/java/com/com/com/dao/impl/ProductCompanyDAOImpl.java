package com.com.com.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.com.com.dao.ProductCompanyDAO;
import com.com.com.vo.ProductCompany;

public class ProductCompanyDAOImpl implements ProductCompanyDAO {

	@Autowired
		private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ProductCompany> getProductCompanyList(ProductCompany product) {
		
		return sqlSessionTemplate.selectList("SQL.ProductCompanySQL.getProductCompanyList", product);
	}


	@Override
	public int insertProductCompany(ProductCompany product) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("SQL.ProductSQL.insertProductCompany", product);
	}

	@Override
	public int updateProductCompany(ProductCompany product) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("SQL.ProductSQL.updateProductCompany", product);
	}

	@Override
	public int deleteProductCompany(Integer COMPANY_CD) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("SQL.ProductSQL.deleteProductCompany", COMPANY_CD);
	}


	@Override
	public ProductCompany product(Integer COMPANY_CD) {
		// TODO Auto-generated method stub
		return null;
	}

}
