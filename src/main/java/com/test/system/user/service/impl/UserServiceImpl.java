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
}
