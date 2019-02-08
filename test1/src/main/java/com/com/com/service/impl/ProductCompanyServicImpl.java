package com.com.com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.com.com.dao.impl.ProductCompanyDAOImpl;
import com.com.com.service.ProductCompanyService;
import com.com.com.vo.ProductCompany;

@Service
public class ProductCompanyServicImpl implements ProductCompanyService {

//	
//	@Autowired
	private ProductCompanyDAOImpl pdao;
//	
	@Override
	public List<ProductCompany> getProductCompanyList(ProductCompany product) {
		// TODO Auto-generated method stub
		return pdao.getProductCompanyList(product);
	}

	@Override
	public ProductCompany product(Integer COMPANY_CD) {
		// TODO Auto-generated method stub
		return pdao.product(COMPANY_CD);
	}

	@Override
	public int insertProductCompany(ProductCompany product) {
		System.out.println(product);
		int success = pdao.insertProductCompany(product);
		return success;
	}

	@Override
	public int updateProductCompany(ProductCompany product) {
		System.out.println(product);
		int success = pdao.updateProductCompany(product);
		return success;
	}

	@Override
	public int deleteProductCompany(Integer COMPANY_CD) {
		int success = pdao.deleteProductCompany(COMPANY_CD);
		return success;
	}

}
