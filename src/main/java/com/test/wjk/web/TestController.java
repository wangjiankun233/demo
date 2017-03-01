package com.test.wjk.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.test.wjk.service.TestService;

@Controller
@RequestMapping("/test1")
public class TestController {
	@Autowired
	private TestService testService;
	
	@RequestMapping("list")
	public String get(Model model){
		List<Map<String,Object>> test =testService.getTest();

		model.addAttribute("test", test);
		return "test";
	}
	

}
