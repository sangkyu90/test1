package com.step3.step6.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.step3.step6.vo.Paging;
import com.step3.step6.vo.SearchData;
import com.step3.step6.vo.Step6;

@Repository
public class Step6Mapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	private void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<Step6> list(Map<String, String> mapp) {
		if(mapp.get("d").equals("1")) {
			mapp.put("d", "asc");
		}else {
			mapp.put("d", "desc");
		}
		List<Step6> list = sqlSession.selectList("step.steplist",mapp);
		if(list.size()==0) {
			List<Step6> list1 = null;
			try {
				Step6 st = new Step6();
				st.setName("");
				st.setHak("");
				st.setKor("");
				st.setEng("");
				st.setMat("");
				st.setPw("");
				list1.add(st);
			} catch (Exception e) {
			}
			return list1;
		}
		return list;
	}
	
	
	public List<Paging> paging(Map<String, String> mapp) {
		return  sqlSession.selectList("step.curpaging", mapp);
	}
	
	public List<SearchData> chk(Map<String, String> mapp){
		if(mapp.get("a").equals("")) {
			mapp.put("a", " ");
		}
		return sqlSession.selectList("step.chk", mapp);
	}

	public List<Step6> detail (Map<String, String> mapp){
		return sqlSession.selectList("step.detail", mapp);
	}
	
	public List<Step6> mod (Map<String, String> mapp){
		sqlSession.update("step.mod", mapp);
		return sqlSession.selectList("step.detail", mapp);
	}
	
	public void del (Map<String, String> mapp) {
		sqlSession.delete("step.del", mapp);
	}
	
	public void ins (Map<String, String> mapp) {
		sqlSession.insert("step.ins", mapp);
	}
	
}
