package com.test.system.leave.web;

import com.test.system.user.service.UserService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
/**
 * Created by wjk on 2017/4/25 0025.
 */
@Controller
@RequestMapping("/leave")
public class LeaveController {

    @Autowired
    private UserService userService;

    @RequestMapping("index")
    public String index(String type ,Model model){
        model.addAttribute("type",type);
        return "leave/leave";
    }

    @RequestMapping("add")
    public String add(String type){
        String url="leave/addjia";
        if("1".equals(type)){
            url="leave/addLi";
        }
        return url;
    }

    @RequestMapping("addLeave")
    @ResponseBody
    public String addLeave(HttpSession session,String type, String reason, String startDate, String endDate, String remark){
        Map<String ,Object> user=(Map<String ,Object>)session.getAttribute("user");
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("type" ,type);
        paramMap.put("reason" ,reason);
        paramMap.put("startDate" ,startDate);
        paramMap.put("endDate" ,endDate);
        paramMap.put("remark" ,remark);
        paramMap.put("userId" ,user.get("id").toString());
        userService.addLeave(paramMap);
        return "success";
    }

    @RequestMapping("getLeave")
    public String getLeave(String type,HttpSession session,Model model){
        String url="leave/getJia";
        if("1".equals(type)){
            url="leave/getLi";
        }
        Map<String ,Object> user=(Map<String ,Object>)session.getAttribute("user");
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("type" ,type);
        paramMap.put("userId" ,user.get("id").toString());
        List<Map<String,Object>> list=userService.getLeave(paramMap);
        JSONArray json=JSONArray.fromObject(list);
        model.addAttribute("leaveList",json.toString());
        return url;
    }
    @RequestMapping("manage")
    public String manage(Model model,String type,HttpSession session){
        String url="leave/manageJia";
        if("1".equals(type)){
            url="leave/manageLi";
        }
        Map<String ,Object> user=(Map<String ,Object>)session.getAttribute("user");
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("type",type);
        paramMap.put("deptId",user.get("deptId").toString());
        List<Map<String,Object>> list=userService.getLeave(paramMap);
        JSONArray json=JSONArray.fromObject(list);
        model.addAttribute("leaveList",json.toString());
        return url;
    }
    @RequestMapping("manageLeave")
    @ResponseBody
    public String manageLeave(String status,String id,String type,String userId){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("id",id);
        paramMap.put("status",status);
        paramMap.put("type",type);
        paramMap.put("userId",userId);
        userService.updateLeaveStatus(paramMap);
        return "success";
    }
}
