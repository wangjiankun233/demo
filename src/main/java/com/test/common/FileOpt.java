package com.test.common;

import java.io.*;

/**
 * Created by wjk on 2017/6/2 0002.
 */
public class FileOpt {
    public static void saveFile(InputStream inputStream,String name){
        OutputStream outputStream=null;
        try{
            String path="D:/word";
            byte[] b=new byte[1024];
            int len;
            File tempFile=new File(path);
            if (!tempFile.exists()) {
                tempFile.mkdirs();
            }
            outputStream=new FileOutputStream(tempFile.getPath()+File.separator+name);
            while ((len=inputStream.read(b))!=-1){
                outputStream.write(b,0,len);
            }
        }catch (IOException e){
             e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try{
                outputStream.close();
                inputStream.close();
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }
   /* public static void main(String[] args){
       String p=Thread.currentThread().getContextClassLoader().getResource("word").getPath();
        File tempFile=new File("D:/word");
        System.out.println(tempFile.getPath());
    }*/
}
