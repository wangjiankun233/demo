package com.test.system.user.service.impl;

import com.test.system.user.dao.UserDao;
import com.test.system.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public void addDept(Map<String, Object> paramMap) {
        userDao.addDept(paramMap);
    }

    public List<Map<String, Object>> getDept(Map<String, Object> paramsMap) {
        return userDao.getDept(paramsMap);
    }

    public void updateDept(Map<String, Object> paramsMap) {
        userDao.updateDept(paramsMap);
    }

    public void deleteDept(Map<String, Object> paramsMap) {
userDao.deleteDept(paramsMap);
    }

    public List<Map<String, Object>> getEmp(Map<String, Object> paramsMap) {
        return userDao.getEmp(paramsMap);
    }

    public void deleteEmp(Map<String, Object> paramsMap) {
userDao.deleteEmp(paramsMap);
    }

    public void addEmp(Map<String, Object> paramsMap) {
userDao.addEmp(paramsMap);
    }

    public void updateEmp(Map<String, Object> paramsMap) {
userDao.updateEmp(paramsMap);
    }

    public void updateStatus(Map<String, Object> paramsMap) {
userDao.updateStatus(paramsMap);
    }
}
