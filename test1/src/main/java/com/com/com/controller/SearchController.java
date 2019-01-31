package com.com.com.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {

	@RequestMapping(value="/step2/check",method=RequestMethod.GET)
	public String home(@RequestParam Map<String,Object> paramMap) {
		
		return "search";
	}
	
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public ModelAndView search(@RequestParam Map<String,String> ParamMap) {
		
		ModelAndView model = new ModelAndView();
		model.setViewName("/step2/check");
		model.addObject("paramMap",ParamMap);		
		return model;
	}

	

}
