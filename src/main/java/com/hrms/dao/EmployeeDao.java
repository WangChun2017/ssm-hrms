package com.hrms.dao;


import com.hrms.domain.Employee;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import java.util.HashMap;
import java.util.List;


@Repository
public interface EmployeeDao {


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
     * @param map
     * @return
     */

    public List<Employee> findByPage(HashMap<String, Object> map);

    /**
     * 根据id查询信息
     */
    public List<Employee> findOne(Integer empId);

    /**
     * 更新用户
     */

    public void updateEmployee(@Param("empName") String empName, @Param("empEmail") String empEmail, @Param("gender") String gender, @Param("empDepartmentId") Integer empDepartmentId, @Param("empId") Integer empId);


    /**
     * 删除用户
     */

    public Integer deleteEmployee(@Param("empId") Integer empId);

    /**
     * 添加用户
     */

    public Integer employeeAdd(@Param("empName") String empName, @Param("empEmail") String empEmail, @Param("gender") String gender, @Param("departmentId") Integer departmentId);
}

