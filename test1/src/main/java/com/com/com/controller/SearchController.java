package com.com.com.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.com.com.dao.MemberDAO;
import com.com.com.dao.Product_tblDAO;
import com.com.com.vo.Member;

@Controller
public class SearchController {

	@Autowired
	private MemberDAO dao;

	@RequestMapping(value = "/check")
	public String search(Model model, Member mem) {

		return "search";
	}

	@RequestMapping(value = "/search")
	public ModelAndView check(ModelAndView model, @RequestParam Map<String, String> ParamMap) {
		System.out.println(ParamMap);

		model.setViewName("/search");
		model.addObject("paramMap", ParamMap);
		return model;
	}

	@RequestMapping(value = "/search1", method = RequestMethod.GET)
	public String test(Model model, Member mem) {
		return "test";
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String abc(String model, @RequestParam Map<String, String> ParamMap) {
		System.out.println(ParamMap);
		model.addAllAttributes("model",<"ParamMap",ParamMap>);
		return model;
	}
}
