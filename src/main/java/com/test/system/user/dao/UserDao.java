package com.test.system.user.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by wjk on 2017/3/12 0012.
 */
public interface UserDao {
    List<Map<String,Object>> getUsers(Map<String,Object> paramsMap);
    List<Map<String,Object>> getMenu(Map<String,Object> paramsMap);
    void addDept(Map<String,Object> paramsMap);
    List<Map<String,Object>> getDept(Map<String,Object> paramsMap);
    void updateDept(Map<String,Object> paramsMap);
    void deleteDept(Map<String,Object> paramsMap);
    List<Map<String,Object>> getEmp(Map<String,Object> paramsMap);
    void deleteEmp(Map<String,Object> paramsMap);
    void addEmp(Map<String,Object> paramsMap);
    void updateEmp(Map<String,Object> paramsMap);
    void updateStatus(Map<String,Object> paramsMap);
    void addWork(Map<String,Object> paramMap);
    void addUserWork(Map<String,Object> paramMap);
    List<Map<String,Object>> getWork(Map<String,Object> paramMap);
    void deleteWork(Map<String,Object> paramMap);
    void deleteUserWork(Map<String,Object> paramMap);
    List<Map<String,Object>>   getWorkEmp(Map<String,Object> paramMap);
    List<Map<String,Object>>  getEmpWork(Map<String,Object> paramMap);
    void updateEmpWorkStatus(String id);
    void addLeave(Map<String,Object> paramMap);
    List<Map<String,Object>> getLeave(Map<String,Object> paramMap);
    void updateLeaveStatus(Map<String,Object> paramMap);
}
