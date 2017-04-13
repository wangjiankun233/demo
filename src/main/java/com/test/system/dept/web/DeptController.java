package com.test.system.dept.web;

import com.test.system.user.service.UserService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wjk on 2017/4/10 0010.
 */
@Controller
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private UserService userService;
    @RequestMapping("")
    public String index(){
        return "dept/dept";
    }
    @RequestMapping("add")
    public String add(){
        return "dept/addDept";
    }
    @RequestMapping("adddept")
    @ResponseBody
    public String addDept(String name,String scope,String remark){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("name",name);
        paramMap.put("scope", scope);
        paramMap.put("remark" ,remark);
        userService.addDept(paramMap);
        return "success";
    }
    @RequestMapping("get")
    public String getDept(String name, Model model){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("name",name);
        List<Map<String,Object>> list=userService.getDept(paramMap);
        JSONArray deptList=JSONArray.fromObject(list);
        model.addAttribute("list",deptList.toString());
        return "dept/serch";
    }
    @RequestMapping("delete")
    @ResponseBody
    public  String delete(String name,String id){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("id",id);
        userService.deleteDept(paramMap);
        return "success";
    }
    @RequestMapping("update")
    @ResponseBody
    public  String update(String name,String id,String scope,String remark){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("name",name);
        paramMap.put("id",id);
        paramMap.put("scope",scope);
        paramMap.put("remark",remark);
        userService.updateDept(paramMap);
        return "success";
    }
}
