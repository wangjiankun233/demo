package com.test.system.user.web;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.test.system.user.service.UserService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wjk on 2017/3/12 0012.
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String  login(){
        return "common/login";
    }
    @RequestMapping("index")
    public String index(Model model ,HttpSession session){
        Map<String,Object> paramsMap=(Map)session.getAttribute("user");
        System.out.println(paramsMap);
        List<Map<String,Object>> menuList=userService.getMenu(paramsMap);
        JSONArray menu=JSONArray.fromObject(menuList);
        model.addAttribute("menu",menu.toString());
        return "common/header";
    }
    @RequestMapping("login")
    @ResponseBody
    public  String userLogin(String userName, String passWord, HttpSession session){
        Map<String,Object> paramsMap = new HashMap<String,Object>();
        if(StringUtils.isBlank(userName)||StringUtils.isBlank(passWord)){
            return "error";
        }
        paramsMap.put("name",userName);
        paramsMap.put("passWord",passWord);
        List<Map<String,Object>> users= userService.getUsers(paramsMap);
        if(users!=null&&users.size()>0){
           session.setAttribute("user",users.get(0));
           return "success";
        }
        return "error";
    }
    @RequestMapping("emp")
    public String emp(String type, Model model){
        System.out.print("++++++"+type+"++++++++++");

        model.addAttribute("type",type);

        return "emp/emp";
    }
    @RequestMapping("add")
    public String add( Model model) {
        List<Map<String,Object>> dept=userService.getDept(new HashMap<String,Object>());
        JSONArray deptList=JSONArray.fromObject(dept);
        model.addAttribute("deptList",deptList.toString());
        System.out.print(deptList.toString());
        return "emp/addEmp";
    }
    @RequestMapping("addEmp")
    @ResponseBody
    public  String addEmp(String type,String bath,String name,String password,String chName ,String idcard ,String deptId,String sex ,String home,String address ){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("bath",bath);
        paramMap.put("name",name);
        paramMap.put("password",password);
        paramMap.put("chName",chName);
        paramMap.put("idcard",idcard);
        paramMap.put("deptId",deptId);
        paramMap.put("sex",sex);
        paramMap.put("home",home);
        paramMap.put("address",address);
        paramMap.put("role",type);
        userService.addEmp(paramMap);
        return "success";
    }
    @RequestMapping("findEmp")
    public  String findEmp(String name,Model model,String type){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("name",name);
        paramMap.put("roleId",type);
        List<Map<String,Object>> list=userService.getEmp(paramMap);
        JSONArray json=JSONArray.fromObject(list);
        model.addAttribute("empList",json.toString());
        return "emp/find";
    }
    @RequestMapping("deleteEmp")
    @ResponseBody
    public  String deleteEmp(String id){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("id" ,id);
        userService.deleteEmp(paramMap);
        return "success";
    }
    @RequestMapping("detail")
    public String detail(String id,Model model){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("id" ,id);
        Map<String,Object> map= userService.getEmp(paramMap).get(0);
        JSONObject json=JSONObject.fromObject(map);
        model.addAttribute("empInfo" ,json.toString());
        return "emp/detail";
    }
    @RequestMapping("update")
    public String update(String id,Model model){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("id" ,id);
        Map<String,Object> map= userService.getEmp(paramMap).get(0);
        JSONObject json=JSONObject.fromObject(map);
        List<Map<String,Object>> dept=userService.getDept(new HashMap<String,Object>());
        JSONArray deptList=JSONArray.fromObject(dept);
        model.addAttribute("deptList",deptList.toString());
        System.out.print(deptList.toString());
        model.addAttribute("empInfo" ,json.toString());
        return "emp/update";
    }
    @RequestMapping("updateEmp")
    @ResponseBody
    public String updateEmp(String id ,String bath,String name,String chName ,String idcard ,String deptId,String sex ,String home,String address ){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("bath",bath);
        paramMap.put("name",name);
        paramMap.put("chName",chName);
        paramMap.put("idcard",idcard);
        paramMap.put("deptId",deptId);
        paramMap.put("sex",sex);
        paramMap.put("home",home);
        paramMap.put("address",address);
        paramMap.put("id",id);
        userService.updateEmp(paramMap);
        return "success";
    }
}
