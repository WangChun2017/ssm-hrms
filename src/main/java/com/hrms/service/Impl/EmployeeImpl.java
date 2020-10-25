package com.hrms.service.Impl;

import com.hrms.dao.EmployeeDao;
import com.hrms.domain.Employee;
import com.hrms.domain.PageBean;
import com.hrms.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service("employee")
public class EmployeeImpl implements EmployeeService {


    @Autowired
    private EmployeeDao employeeDao;

    @Override
    public List<Employee> findAll() {
        System.out.println("业务层：findAll()方法执行了");

        return employeeDao.findAll();
    }

    /**
     * 一对一查询
     *
     * @return
     */
    @Override
    public List<Employee> findAllList() {

        return employeeDao.findAllList();
    }

    /**
     * 查找所有记录条数
     *
     * @return
     */
    @Override
    public Integer findAllCount() {

        return employeeDao.findAllCount();
    }


    /**
     * 分页查询
     *
     * @param currentPage
     * @return
     */
    @Override
    public PageBean<Employee> findByPage(int currentPage,String condition) {
        HashMap<String, Object> map = new HashMap<>();
        PageBean<Employee> pageBean = new PageBean<>();

        /**
         * 设置当前页
         */
        pageBean.setCurrPage(currentPage);
        /**
         * 设置模糊查询条件
         */
        pageBean.setCondition(condition);
        System.out.println("service层"+condition);

        /**
         * 设置每页显示的记录数
         */
        pageBean.setPageSize(5);

        /**
         * 设置总记录数
         */
        Integer count = employeeDao.findAllCount();
        pageBean.setTotalCount(count);

        /**
         * 设置总页面
         */
        if (count % 5 != 0) {
            //不能被5整除
            pageBean.setTotalPages((count / 5) + 1);
        } else {
            //可以被5整除
            pageBean.setTotalPages(count / 5);
        }

        /**
         * 设置起始和结束页
         */
        map.put("start", (currentPage - 1) * 5);
        map.put("end", pageBean.getPageSize());
        map.put("condition",condition);
        List<Employee> list = employeeDao.findByPage(map);
        pageBean.setList(list);
        return pageBean;
    }


    /**
     * 根据id查询信息
     *
     * @param empId
     * @return
     */
    @Override
    public List<Employee> findOne(Integer empId) {
        return employeeDao.findOne(empId);
    }


    /**
     * 更新用户
     *
     * @param empName
     * @param empEmail
     * @param gender
     * @param empDepartmentId
     * @param empId
     */
    @Override
    public void updateEmployee(String empName, String empEmail, String gender, Integer empDepartmentId, Integer empId) {

        employeeDao.updateEmployee(empName, empEmail, gender, empDepartmentId, empId);
    }


    /**
     * 删除用户
     *
     * @param empId
     */
    @Override
    public Integer deleteEmployee(Integer empId) {
        return employeeDao.deleteEmployee(empId);

    }


    /**
     * 添加用户
     *
     * @param empName
     * @param empEmail
     * @param gender
     * @param departmentId
     * @return
     */
    @Override
    public Integer employeeAdd(String empName, String empEmail, String gender, Integer departmentId) {

        return employeeDao.employeeAdd(empName, empEmail, gender, departmentId);
    }

    @Override
    public List<Employee> findByNameBlu(String empName) {

        return employeeDao.findByNameBlu(empName);
    }
}
