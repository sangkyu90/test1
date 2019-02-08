package com.com.com.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.com.com.vo.Member;

@Controller
public class SearchController {

	@RequestMapping(value="/check")
	public String search(Model model, Member mem) {
		
		return "search";
	}
	
	@RequestMapping(value="/search")
	public ModelAndView check(ModelAndView model, @RequestParam Map<String,String> ParamMap) {
		System.out.println(ParamMap);
		 
		model.setViewName("/search");
		model.addObject("paramMap",ParamMap);		
		return model;
	}

	

}
