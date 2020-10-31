package com.hrms.controller;

import com.hrms.domain.CheckCode;
import com.hrms.domain.Employee;
import jdk.internal.util.xml.impl.Input;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.tools.ant.types.FileList;
import org.springframework.web.bind.annotation.RequestBody;
import org.testng.annotations.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/file")
public class FileController {

    /**
     * 跳转到文件主页面
     *
     * @return
     */
    @RequestMapping("/fileToFileMain")
    public String fileToFileMain() {
        return "fileMain";
    }

    @RequestMapping("/fileUpload")
    public String fileUpload(HttpServletRequest request, MultipartFile upload, Model model) throws IOException {

        //获取文件路径
        String path = request.getSession().getServletContext().getRealPath("/upload/");
        System.out.println(path);
        //解析路径
        File file = new File(path);

        //判断文件路径是否存在
        if (!file.exists()) {
            //文件不存在
            file.mkdirs();
        }
        //文件存在
        //获取文件名字
        String filename = upload.getOriginalFilename();

        //生成UUID
        String uuid = UUID.randomUUID().toString().replace("-", "");

        //拼接字符串

        filename = uuid + "_" + filename;
        //完成文件上传
        upload.transferTo(new File(path, filename));


        model.addAttribute("fileUrl", path);
        model.addAttribute("fileName", filename);


        return "success";

    }

    @RequestMapping("/upload")
    public String upload(Model model) {
        List<String> list = new ArrayList<String>();
        String path = "D:\\IDEA\\WorkSpace\\ssm-hrms\\target\\ssm-hrms\\upload\\";

        File file = new File(path);
        File[] files = file.listFiles();

        for (File file1 : files) {

            String[] splits = file1.toString().split("\\\\");
            for (int i = 0; i < splits.length; i++) {
                if (i == splits.length - 1) {

                    list.add(splits[i]);

                }
            }
        }

        model.addAttribute("list", list);

        return "fileUpload";
    }

    @RequestMapping("/fileDownload")
    public void fileDownLoad(@RequestParam(value = "filename" ,defaultValue = "") String filename, HttpServletResponse response, HttpServletRequest request) throws IOException {

        System.out.println(filename);

        String path = "D:\\IDEA\\WorkSpace\\ssm-hrms\\target\\ssm-hrms\\upload" + "\\" + filename;
        System.out.println(path);
        System.out.println(filename);
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(path)));
        filename = URLEncoder.encode(filename, "UTF-8");
        //设置下载的名字  filename
        response.setHeader("Content-Disposition", "attachment;fileName=" + filename);
        //设置下载
        response.setContentType("multipart/octet-stream");

        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while ((len = bis.read()) != -1) {
            out.write(len);
            out.flush();
        }
        out.close();

    }

    @RequestMapping("/fileTest")
    @ResponseBody
    public String fileTest() {
        return "login";
    }
}
