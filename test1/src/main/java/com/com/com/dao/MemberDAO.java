package com.com.com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.com.com.dao.impl.Product_tablDAOImpl;
import com.com.com.vo.Product_tbl;

@Repository

public class MemberDAO {
	@Autowired
	private Product_tablDAOImpl dao;
	
	public List<Product_tbl> SelectProduct_tbl(Product_tbl vo) throws Exception {
		return dao.SelectProduct_tbl(vo) ;
	}

}
