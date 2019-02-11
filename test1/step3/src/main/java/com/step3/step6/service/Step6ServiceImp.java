package com.step3.step6.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.step3.step6.mapper.Step6Mapper;
import com.step3.step6.vo.Paging;
import com.step3.step6.vo.SearchData;
import com.step3.step6.vo.Step6;

@Repository
public class Step6ServiceImp implements Step6Service {

	@Autowired
	private Step6Mapper mapper;

	@Override
	public List<Step6> list(Map<String, String> mapp) {
		return mapper.list(mapp);
	}

	@Override
	public List<Paging> paging(Map<String, String> mapp) {
		return mapper.paging(mapp);
	}

	@Override
	public List<SearchData> chk(Map<String, String> mapp) {
		return mapper.chk(mapp);
	}

	@Override
	public List<Step6> detail(Map<String, String> mapp) {
		return mapper.detail(mapp);
	}

	@Override
	public List<Step6> mod(Map<String, String> mapp) {
		return mapper.mod(mapp);
	}

	@Override
	public void del(Map<String, String> mapp) {
		mapper.del(mapp);
	}

	@Override
	public void ins(Map<String, String> mapp) {
		mapper.ins(mapp);
	}
	
}
