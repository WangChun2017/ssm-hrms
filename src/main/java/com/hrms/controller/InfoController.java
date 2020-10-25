package com.hrms.controller;

import com.hrms.domain.CheckCode;
import com.hrms.domain.Info;
import com.hrms.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/info")
public class InfoController {

    @Autowired
    private InfoService infoService;


    /***
     * 跳转到登录页面
     * @return
     */
    @RequestMapping("/jumpLogin")
    public String jumpLogin() {
        return "login";
    }

    @PostMapping("/loginInfo")
    @ResponseBody
    public Integer loginInfo(@RequestBody CheckCode checkCode, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        HttpSession session = request.getSession();
        String loginCode = (String) session.getAttribute("loginCode");
        System.out.println(loginCode);
        System.out.println(checkCode.getCheckCode());
        session.removeAttribute("loginCode");
        if (!checkCode.getCheckCode().equalsIgnoreCase(loginCode)) {
            return 300;
        }
        List<Info> login_info = infoService.findByNameAndPassword(checkCode.getLoginName(), checkCode.getLoginPassword());
        session.setAttribute("username",checkCode.getLoginName());
        if (login_info.size() != 1) {
            return 100;
        } else {
            return 200;
        }
    }

    @RequestMapping("/jumpMain")
    public String jumpMain() {
        return "main";
    }

}

