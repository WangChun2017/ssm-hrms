package com.hrms.controller;


import com.hrms.domain.Employee;
import com.hrms.domain.Info;
import com.hrms.domain.PageBean;
import com.hrms.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/testFindAll")
    public String testFindAll(Model model) {
//        System.out.println("表现层：测试查找所有的方法执行了");
        List<Employee> list = employeeService.findAll();
        model.addAttribute("list", list);
        return "success";
    }


    @RequestMapping("/getEmployeeInfo")
    public String getEmployeeInfo() {

        return "employeePage";

    }

    /**
     * 一对一查询
     *
     * @return
     */
    @RequestMapping("/findAllList")
    public String finaAllList(HttpServletRequest request, Model model, @RequestParam(value = "currentPage", defaultValue = "1", required = false) Integer currentPage, @RequestParam(value = "condition", required = false, defaultValue = "") String condition) {
        List<Employee> lists = employeeService.findAllList();
        HttpSession session = request.getSession();
        PageBean<Employee> byPage = employeeService.findByPage(currentPage, condition);
//        System.out.println(byPage.getList().size());
        System.out.println(byPage.getList().toString());
        System.out.println(condition);
        model.addAttribute("psgMsg", byPage);
        session.setAttribute("lists", lists);
        return "employeePage";
    }


    /**
     * 更新用户
     * 根据id查询用户
     *
     * @return
     */
    @RequestMapping("/employeeUpdate")
    public String employeeUpdate(@RequestParam(value = "empId", defaultValue = "2", required = false) Integer empId, Model model) {
        List<Employee> list = employeeService.findOne(empId);
        model.addAttribute("list", list);
        System.out.println(list);
        return "employeeUpdate";
    }

    /**
     * 完成修改
     */
    @RequestMapping("/finialUpdate")
    public String finialUpdate(@RequestParam("empName") String empName, @RequestParam("empEmail") String empEmail, @RequestParam("gender") String gender, @RequestParam("empDepartmentId") Integer empDepartmentId, @RequestParam(value = "empId") Integer empId,
                               HttpServletRequest request, Model model, @RequestParam(value = "currentPage", defaultValue = "1", required = false) Integer currentPage, @RequestParam(value = "condition", defaultValue = "", required = false) String condition) {

        employeeService.updateEmployee(empName, empEmail, gender, empDepartmentId, empId);

        return finaAllList(request, model, currentPage, condition);

    }

    /**
     * 删除用户
     */
    @RequestMapping("/deleteEmployee")
    @ResponseBody
    public Integer deleteEmployee(@RequestParam("deleteId") String deleteId) {
        int parseInt = Integer.parseInt(deleteId);
        Integer res = employeeService.deleteEmployee(parseInt);
        if (res != 1) {
            return 100;
        }
        return 200;
    }


    @RequestMapping("/toEmployeeAdd")
    public ModelAndView toEmployeeAdd() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("employeeAdd");
        return mv;
    }

    @RequestMapping("/employeeAdd")
    @ResponseBody
    public Integer employeeAdd(@RequestBody(required = false) Employee employee) {
        System.out.println(employee);
        System.out.println(employee.getEmpName());
        Integer res = employeeService.employeeAdd(employee.getEmpName(), employee.getEmpEmail(), employee.getGender(), employee.getDepartmentId());
        if (res != 1) {
            return 100;
        } else {

            return 200;
        }

    }


    @RequestMapping("/employeeSearch")
    @ResponseBody
    public Integer employeeSearch(@RequestParam(value = "empName", required = false) String empName, HttpServletRequest request, Model model) {
        System.out.println("执行了employeeSearch");
        System.out.println(empName);

        return 100;
    }

    @RequestMapping("/logout")
    @ResponseBody
    public Integer  logout(HttpServletRequest request) {

        System.out.println("执行了logout");
        HttpSession session = request.getSession();
        session.removeAttribute("username");

        return 100;
    }
}
