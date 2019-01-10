package com.ccut.bits.file;

import com.ccut.bits.literature.service.LiteratureService;
import com.ccut.bits.model.User;
import com.ccut.bits.upload.service.Uploadlm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

@Controller
public class UploadAction {
    @Autowired
    private Uploadlm upload;
    @Autowired
    private LiteratureService literatureService;
    @RequestMapping(value="uploadFile",method= RequestMethod.POST)
   public @ResponseBody  HashMap<String, String> uploadFile(@RequestParam(value = "input[]", required = true) MultipartFile file[],HttpServletRequest request,HttpSession session) throws IOException {
        User user=(User)session.getAttribute("User");
        for(int i = 0;i<file.length;i++){
            if(file[i] != null){
                //取得当前上传文件的文件名称
                int userId=user.getUserId();
                String myFileName = file[i].getOriginalFilename();
                String myFileType = file[i].getContentType();
                 long myFileSize= file[i].getSize();
                myFileType=literatureService.getTypeGeneralbyTypeName(myFileType);
                Date date=new Date();
                DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String time=format.format(date);
                String myFileTime=time;
                com.ccut.bits.upload.Model.File modle=new com.ccut.bits.upload.Model.File(myFileName,myFileType,myFileTime,userId,myFileSize/1024);
                upload.addPermission(modle);
                //如果名称不为“”,说明该文件存在，否则说明该文件不存在
                if(myFileName.trim() !=""){
                    //重命名上传后的文件名
                    String fileName = file[i].getOriginalFilename();
                    //定义上传路径

                    //服务器地址C:/apache-tomcat-7.0.52/webapps/bits  http://111.116.20.180:20482/bits/upload/
                    // 调试地址E:/比特能专家机器人/baymax/bits-parent/bits-webapp/src/main/webapp/upload/
                    //调试地址测试http://localhost:8080/bits/image/
                    String path = "C:/apache-tomcat-7.0.52/webapps/bits/upload/" + fileName;
                  System.out.println("注意地址错误");
                    if(myFileType.equals("word")||myFileType.equals("excel")||myFileType.equals("ppt")||myFileType.equals("ppt_wps")||myFileType.equals("excel_wps")||myFileType.equals("word_wps")||myFileType.equals("html")||myFileType.equals("txt")||myFileType.equals("pdf")||myFileType.equals("rar")||myFileType.equals("zip"))
                    {
                        //调试地址E:/比特能专家机器人/baymax/bits-parent/bits-webapp/src/main/webapp/upload/documents/
                        path = "C:/apache-tomcat-7.0.52/webapps/bits/upload/documents/" + fileName;
                    }
                    System.out.println("文件地址为"+path);
                    File localFile = new File(path);
                    file[i].transferTo(localFile);
                }
            }

        }
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("true", " ");
        return map;
    }
    @RequestMapping(value="uploadFileOne",method= RequestMethod.POST)//上传缩略图
    public @ResponseBody  HashMap<String, String> uploadFile(@RequestParam(value = "input", required = true) MultipartFile file,@RequestParam("fileId")Integer id) throws IOException {
        String path="/D";
        String myFileName = file.getOriginalFilename();
            if(file != null){
                //如果名称不为“”,说明该文件存在，否则说明该文件不存在
                if(myFileName.trim() !=""){
                    //重命名上传后的文件名
                    String fileName = file.getOriginalFilename();
                    //定义上传路径调试地址E:/比特能专家机器人/baymax/bits-parent/bits-webapp/src/main/webapp/image/
                    // 测试地址D:/teamwork/apache-tomcat-7.0.52/webapps/bits/image/
                    //C:/apache-tomcat-7.0.52/webapps/bits/upload
                    // C:\apache-tomcat-7.0.52\webapps\bits\image
                     path = "C:/apache-tomcat-7.0.52/webapps/bits/image/" + fileName;
                    System.out.println("图片地址为"+path);
                    File localFile = new File(path);
                    file.transferTo(localFile);

            }
                String fileName = file.getOriginalFilename();
                com.ccut.bits.upload.Model.File modle=new com.ccut.bits.upload.Model.File(fileName,id);
                upload.addimg(modle);
        }
        HashMap<String, String> map = new HashMap<String, String>();
        map.put("true", " ");
        return map;
    }
    }


