package com.com.com.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SearchController {

	@RequestMapping(value="/hoem" method=RequestMethod.GET)
	public String search(@RequestParam Map<String,Object> paramMap) {
		
		return "";
	}
	
	@RequestMapping(value="/search" method=RequestMethod.POST)
	public ModelAndView search(@RequestParam Map<String,String> ParamMap)

	ModelAndView search = new 
}
