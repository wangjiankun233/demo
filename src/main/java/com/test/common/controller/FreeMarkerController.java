package com.test.common.controller;

import java.util.Map;


public interface FreeMarkerController {
    public String getProductionFile(Map<String,Object> freemarkerData, String templateName);
}
