package com.test.system.user.web;

import com.test.system.user.service.UserService;
import net.sf.json.JSONArray;
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
}
