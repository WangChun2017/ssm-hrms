package com.hrms.domain;

import java.io.Serializable;

public class Employee implements Serializable {

    private Integer empId;
    private String empName;
    private String empEmail;
    private String gender;
    private Integer departmentId;

    /**
     * 一对一查询
     */
    private Department department;


    /**
     * get and set 方法
     *
     * @return
     */


    public Integer getEmpId() {
        return empId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }


    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    /**
     * toString 方法
     *
     * @return
     */
    @Override
    public String toString() {
        return "Employee{" +
                "empId=" + empId +
                ", empName='" + empName + '\'' +
                ", empEmail='" + empEmail + '\'' +
                ", gender='" + gender + '\'' +
                ", departmentId=" + departmentId +
                ", department=" + department +
                '}';
    }
}
