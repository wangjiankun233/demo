package com.test.wjk.web;

import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.test.wjk.service.TestService;

@Controller
@RequestMapping("/test1")
public class TestController {
	@Autowired
	private TestService testService;
	@RequestMapping("list")
	public String get(Model model){
		List<Map<String,Object>> test =testService.getTest();
		JSONArray json =JSONArray.fromObject(test);
		model.addAttribute("test", json.toString());
		return "ftl/hello";
	}
	

}
