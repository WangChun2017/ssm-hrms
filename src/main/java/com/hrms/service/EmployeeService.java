package com.hrms.service;

import com.hrms.domain.Employee;
import com.hrms.domain.PageBean;

import java.util.List;

public interface EmployeeService {

    public List<Employee> findAll();

    /**
     * 一对一查询
     *
     * @return
     */
    public List<Employee> findAllList();

    /**
     * 查找记录条数
     *
     * @return
     */
    public Integer findAllCount();

    /**
     * 分页查询
     *
     * @param currentPage
     * @return
     */
    public PageBean<Employee> findByPage(int currentPage);

    /**
     * 根据id查询信息
     */
    public List<Employee> findOne(Integer empId);

    /**
     * 更新用户
     */
    public void updateEmployee(String empName, String empEmail, String gender, Integer empDepartmentId, Integer empId);


    /**
     * 删除用户
     */

    public Integer deleteEmployee(Integer empId);

    /**
     * 添加用户
     */

    public Integer employeeAdd(String empName, String empEmail, String gender, Integer departmentId);
}
