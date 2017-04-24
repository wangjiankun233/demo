package com.test.system.user.service.impl;

import com.test.system.user.dao.UserDao;
import com.test.system.user.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * Created by wjk on 2017/3/12 0012.
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    public List<Map<String, Object>> getUsers(Map<String, Object> paramsMap) {
        return userDao.getUsers(paramsMap);
    }

    public List<Map<String, Object>> getMenu(Map<String, Object> paramsMap) {
        return userDao.getMenu(paramsMap);
    }
    @Transactional
    public void addDept(Map<String, Object> paramMap) {
        userDao.addDept(paramMap);
    }

    public List<Map<String, Object>> getDept(Map<String, Object> paramsMap) {
        return userDao.getDept(paramsMap);
    }
    @Transactional
    public void updateDept(Map<String, Object> paramsMap) {
        userDao.updateDept(paramsMap);
    }
    @Transactional
    public void deleteDept(Map<String, Object> paramsMap) {
userDao.deleteDept(paramsMap);
    }

    public List<Map<String, Object>> getEmp(Map<String, Object> paramsMap) {
        return userDao.getEmp(paramsMap);
    }
    @Transactional
    public void deleteEmp(Map<String, Object> paramsMap) {
userDao.deleteEmp(paramsMap);
    }
    @Transactional
    public void addEmp(Map<String, Object> paramsMap) {
userDao.addEmp(paramsMap);
    }
    @Transactional
    public void updateEmp(Map<String, Object> paramsMap) {
userDao.updateEmp(paramsMap);
    }
    @Transactional
    public void updateStatus(Map<String, Object> paramsMap) {
userDao.updateStatus(paramsMap);
    }
    @Transactional
    public void addWork(Map<String, Object> paramsMap) {
      userDao.addWork(paramsMap);
      String emps=(String)paramsMap.get("empData");
      String[] e=emps.split(",");
      for(String empId :e){
          paramsMap.put("userId",empId);
          if(StringUtils.isNotBlank(empId)){
          userDao.addUserWork(paramsMap);
          }
      }
    }

    public List<Map<String, Object>> getWork(Map<String, Object> paramMap) {
        return userDao.getWork(paramMap);
    }
    @Transactional
    public void deleteWork(Map<String, Object> paramMap) {
        userDao.deleteWork(paramMap);
        userDao.deleteUserWork(paramMap);
    }

    public List<Map<String, Object>> getWorkEmp(Map<String, Object> paramMap) {
        return userDao.getWorkEmp(paramMap);
    }

    public List<Map<String, Object>> getEmpWork(Map<String, Object> paramMap) {
        return userDao.getEmpWork(paramMap);
    }

    public void updateEmpWorkStatus(String id) {
        userDao.updateEmpWorkStatus(id);
    }


}
