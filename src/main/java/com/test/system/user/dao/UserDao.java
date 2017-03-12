package com.test.system.user.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by wjk on 2017/3/12 0012.
 */
public interface UserDao {
    List<Map<String,Object>> getUsers(Map<String,Object> paramsMap);
    List<Map<String,Object>> getMenu(Map<String,Object> paramsMap);
}
