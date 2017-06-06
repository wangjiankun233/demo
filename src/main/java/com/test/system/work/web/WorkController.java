package com.test.system.work.web;

import com.test.system.user.service.UserService;
import net.sf.json.JSON;
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
import java.util.UUID;

/**
 * Created by wjk on 2017/4/19 0019.
 */
@Controller
@RequestMapping("/work")
public class WorkController {
    @Autowired
    UserService userService;
    @RequestMapping("index")
    public String index(String type , Model model){
        model.addAttribute("type",type);
        return "work/work";
    }
    @RequestMapping("add")
    public String add(Model model,HttpSession session){
        Map<String,Object> paramMap =new HashMap<String,Object>();
        Map<String,Object> user=(Map<String,Object>)session.getAttribute("user");
        paramMap.put("deptId",user.get("deptId"));
        paramMap.put("status","0");
        paramMap.put("roleId","3");
        List<Map<String,Object>> list= userService.getEmp(paramMap);
        JSONArray json=JSONArray.fromObject(list);
        model.addAttribute("empList" ,json.toString());
        return "work/addWork";
    }
    @RequestMapping("addWork")
    @ResponseBody
    public String addWork(HttpSession httpSession ,String empData,String local,String info,String type,String remark,String date){
        UUID id=UUID.randomUUID();
        Map<String,Object> user=(Map<String, Object>) httpSession.getAttribute("user");
        System.out.println("++++:"+user.get("id").toString());
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("id",id.toString());
        paramMap.put("empData",empData);
        paramMap.put("local",local);
        paramMap.put("info",info);
        paramMap.put("type",type);
        paramMap.put("remark",remark    );
        paramMap.put("date",date);
        paramMap.put("userId",user.get("id").toString());
        userService.addWork(paramMap);
        return "success";
    }

    @RequestMapping("getWork")
    public String getWork(String type ,Model model,HttpSession httpSession){
        Map<String,Object> user=(Map<String, Object>) httpSession.getAttribute("user");
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("userId",user.get("id").toString());
        paramMap.put("type",type);
        List<Map<String,Object>> list=userService.getWork(paramMap);
        JSONArray json=JSONArray.fromObject(list);
        model.addAttribute("workList",json.toString());
        return "work/findWork";
    }
    @RequestMapping("delete")
    @ResponseBody
    public String delete(String id){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("id",id);
        userService.deleteWork(paramMap);
        return "success";
    }

    @RequestMapping(value="getWorkEmp",produces = "application/json; charset=utf-8")
    @ResponseBody
    public JSON getWorkEmp(String id){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("id",id);
        List<Map<String,Object>> list=userService.getWorkEmp(paramMap);
        JSONArray json=JSONArray.fromObject(list);
        return json;
    }
    @RequestMapping("getEmpWork")
    public String getEmpWork(String type,HttpSession session,Model model){
        Map<String,Object> user=(Map<String,Object>)session.getAttribute("user");
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("id",user.get("id"));
        paramMap.put("type",type);
        List<Map<String,Object>> list=userService.getEmpWork(paramMap);
        JSONArray json=JSONArray.fromObject(list);
        model.addAttribute("workList",json.toString());
        return "work/userWork";
    }
    @RequestMapping("gotIt")
    @ResponseBody
    public String gotIt(String id){
        userService.updateEmpWorkStatus(id);
        return "success";
    }
}
