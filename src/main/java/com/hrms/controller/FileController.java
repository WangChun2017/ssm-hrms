package com.hrms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

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
    public String fileUpload(HttpServletRequest request, MultipartFile upload) throws IOException {

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

        return "success";

    }
}
