package com.com.com.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.com.com.dao.Product_tblDAO;
import com.com.com.vo.Product_tbl;

@Repository
public class Product_tablDAOImpl implements Product_tblDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final String NAMESPACE =  "ProductCompanySQL";
	

	@Override
	public List<Product_tbl> SelectProduct_tbl(Product_tbl vo) {
		
		
	 return sqlSession.selectList(NAMESPACE+"ProductCompanySQL",vo);

	}

}
