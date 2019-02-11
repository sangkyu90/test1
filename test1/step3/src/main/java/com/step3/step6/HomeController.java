package com.step3.step6;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.step3.step6.service.Step6ServiceImp;
import com.step3.step6.vo.Paging;
import com.step3.step6.vo.SearchData;
import com.step3.step6.vo.Step6;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private Step6ServiceImp service;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home( Model model) {
		return "home";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> testList(
			//@RequestParam(value="page", required=false, defaultValue="1") String page,
			//@RequestParam(value="rows", required=false, defaultValue="5") String rows,
			//@RequestParam(value="a", required=false, defaultValue="") String a,
			//@RequestParam(value="d", required=false, defaultValue="asc") String d,
			//@RequestParam(value="send", required=false, defaultValue="name") String send,
			@RequestParam Map<String, String> mapp) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Paging> paging = service.paging(mapp);
		paging.get(0).setPage(mapp.get("page"));
		paging.get(0).setRows(mapp.get("rows"));
		List<Step6> list = service.list(mapp);
		map.put("paging", paging);
		map.put("list", list);
		return map;
	}
	
	@RequestMapping(value = "/chk", method = RequestMethod.GET)
	@ResponseBody
	public List<SearchData> chk(
			@RequestParam Map<String, String> map) {
		return service.chk(map);
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	@ResponseBody
	public List<Step6> detail(
			@RequestParam Map<String, String> map) {
		return service.detail(map);
	}
	
	@RequestMapping(value = "/menu", method = RequestMethod.POST)
	@ResponseBody
	public List<Step6> menu(
			@RequestParam Map<String, String> map) {
		List<Step6> list = null;
		if(map.get("menu").equals("mod")) {
			list = service.mod(map);
		}else if(map.get("menu").equals("del")) {
			service.del(map);
		}else {
			service.ins(map);
		}
		return list;
	}
	
}
