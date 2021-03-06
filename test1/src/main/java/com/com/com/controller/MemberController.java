package com.com.com.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.com.com.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	SqlSession sqlsession;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Member mem) {

		return "NewFile";
	}

	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public ModelAndView send(@RequestParam Map<String,Object> paramMap, @RequestParam(value="hobby") String[] hobbies) {
		
	
		ModelAndView model = new ModelAndView();
		model.setViewName("home");
		paramMap.put("hobby", hobbies);
		model.addObject("paramMap",paramMap);
		System.out.print(paramMap);
		return model;
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model, Member mem) {
		List<String> list = sqlsession.selectList("SQL.ProductCompany.testlist");
		System.out.println("list1 : " + list.get(0));
		
		return "test";
	}
}
