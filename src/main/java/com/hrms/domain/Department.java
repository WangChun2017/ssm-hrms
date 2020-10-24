package com.hrms.domain;

import java.io.Serializable;

public class Department implements Serializable {


    private Integer deptId;
    private String deptName;
    private String deptLeader;


    /**
     * get and set 方法
     *
     * @return
     */
    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDeptLeader() {
        return deptLeader;
    }

    public void setDeptLeader(String deptLeader) {
        this.deptLeader = deptLeader;
    }

    /**
     * toString 方法
     *
     * @return
     */

    @Override
    public String toString() {
        return "Department{" +
                "deptId=" + deptId +
                ", deptName='" + deptName + '\'' +
                ", deptLeader='" + deptLeader + '\'' +
                '}';
    }
}
