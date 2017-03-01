package com.test.wjk.service.impl;

import java.util.List;
import java.util.Map;

import com.test.wjk.dao.TestDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.test.wjk.service.TestService;
@Service
public class TestServiceImpl implements TestService{

	@Autowired
	private TestDao testDao;
	public List<Map<String, Object>> getTest() {
		// TODO Auto-generated method stub
		return testDao.getTest();
	}

}
