package com.test.system.leave.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by wjk on 2017/4/25 0025.
 */
@Controller
@RequestMapping("/leave")
public class LeaveController {

    @RequestMapping("index")
    public String index(String type){
        return "";
    }

    @RequestMapping("manage")
    public String manage(String type){
        return "";
    }
}
