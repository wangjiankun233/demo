package com.test.system.contract.web;

import com.test.common.FileOpt;
import com.test.system.user.service.UserService;
import net.sf.json.JSONArray;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wjk on 2017/6/1 0001.
 */
@Controller
@RequestMapping("/contract")
public class ContractController {
    @Autowired
    private UserService userService;

    @RequestMapping("list")
    public String list(Model model ,String name){
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("name",name);
        List<Map<String,Object>> list=userService.getEmp(paramMap);
        JSONArray json=JSONArray.fromObject(list);
        model.addAttribute("empList",json.toString());
        return "contract/contract";
    }
    @RequestMapping(value="upload", method= RequestMethod.POST,produces="text/html;charset=utf-8")
    @ResponseBody
    public String upload(@RequestParam(value="file", required=false) MultipartFile file,
                         @RequestParam(value="name",required = false) String name,
                         @RequestParam(value="id",required = false) String id)throws IOException{
        Map<String,Object> paramMap=new HashMap<String,Object>();
        paramMap.put("contract",name);
        paramMap.put("id",id);
        FileOpt.saveFile(file.getInputStream(),name);
        userService.upload(paramMap);
        return "success";
    }
    @RequestMapping("downLoad")
    public void download(String fileName, HttpServletResponse response){
        response.reset();

       response.setContentType("bin");
        response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName+"\"");
        InputStream in=null;
        OutputStream out=null;
        try {
            System.out.print(fileName);
            File f=new File("D:/haha");
            File file=new File("D:/word/"+fileName);
            in = new FileInputStream(file);
            out = response.getOutputStream();
           OutputStream  outputStream=new FileOutputStream(f.getPath()+File.separator+"funck.doc");

            int len;
            byte[] b = new byte[1024];
            while ((len = in.read(b)) != -1) {
                 out.write(b,0,len);
                 outputStream.write(b,0,len);
            }
            outputStream.close();
      }catch (IOException e){
          e.printStackTrace();
      }finally {
          try{
              in.close();
              out.close();
          }catch (IOException e){
              e.printStackTrace();
          }

       }
    }
    @RequestMapping("downLoad2")
    public ResponseEntity<byte[]> download2(String fileName) throws IOException {
        System.out.println("downLoad2");
        File file=new File("D:\\word\\"+fileName);
       // String dfileName=new String(fileName.getBytes("gb2312"),"iso8859-1");
        HttpHeaders headers=new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        headers.setContentDispositionFormData("attachment", URLEncoder.encode(fileName,"UTF-8"));
        System.out.println(fileName);
        System.out.println(file.exists());
        System.out.println(file.getPath());
        System.out.println(file);
        System.out.println(new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED));
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.CREATED);
    }
    @RequestMapping("downLoad3")
    public String gaga(){
        System.out.print("sfsfsdfsd");
        return "asdsfsafsaf";
    }
}
