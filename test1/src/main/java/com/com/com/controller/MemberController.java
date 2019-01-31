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
public class MemberController {

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, Member mem) {

		return "NewFile";
	}

	@RequestMapping(value = "/send", method = RequestMethod.POST)
	public ModelAndView send(@RequestParam Map<String,Object> paramMap, @RequestParam(value="hobby") String[] hobbies) {
		
//		String name = new String(mem.getName());
//		name.length();
//		System.out.println("name : " + mem.getName());
//		
//		String names = new String(mem.getName());
//		names.getBytes();
//		System.out.println("name : " + mem.getName());
//
//		
//		System.out.println("gender : " + mem.getGender());
//		
//		List<String> year = new ArrayList<String>();
//		for(int i=0; i<mem.getYear().length(); i++) {
//			year.add(mem.getYear());
//		}
//		System.out.println("year : " + mem.getYear());
//		
//		ArrayList<String> hobby = new ArrayList<String>();
//		for (int i = 0; i < mem.getHobby().length; i++) {
//			hobby.add(mem.getHobby()[i]);	
//			System.out.println("hobby : " + mem.getHobby()[i]);
//		}
//
//		String str = mem.getMemo();
//		int memo = str.length();
//		Integer.toString(memo);
//		System.out.println("memo : " + mem.getMemo().length());
//		
//		
//	
//		System.out.println("tel : " + mem.getTelno1() + " - " + mem.getTelno2() + " - " + mem.getTelno3());
//
//		model.addAttribute("mem", name);
//		model.addAttribute("mem", names);
//		model.addAttribute("mem", year);
//		model.addAttribute("mem", hobby);
//		model.addAttribute("mem", memo);
//		model.addAttribute("mem", mem);
		ModelAndView model = new ModelAndView();
		model.setViewName("home");
		paramMap.put("hobby", hobbies);
		model.addObject("paramMap",paramMap);
		System.out.print(paramMap);
		return model;
	}

}
