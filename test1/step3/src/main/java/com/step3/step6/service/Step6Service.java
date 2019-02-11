package com.step3.step6.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.step3.step6.vo.Paging;
import com.step3.step6.vo.SearchData;
import com.step3.step6.vo.Step6;

public interface Step6Service {
	public List<Step6> list (Map<String, String> mapp);
	public List<Paging> paging (Map<String, String> mapp);
	public List<SearchData> chk (Map<String, String> mapp);
	public List<Step6> detail (Map<String, String> mapp);
	public List<Step6> mod (Map<String, String> mapp);
	public void del (Map<String, String> mapp);
	public void ins (Map<String, String> mapp);
}
