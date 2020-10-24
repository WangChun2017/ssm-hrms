package com.hrms.domain;

import java.io.Serializable;

public class Info implements Serializable {
    private Integer loginId;
    private String loginName;
    private String loginPassword;


    /**
     * get and set 方法
     *
     * @return
     */


    public String getLoginName() {
        return loginName;
    }

    public Integer getLoginId() {
        return loginId;
    }

    public void setLoginId(Integer loginId) {
        this.loginId = loginId;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }

    /**
     * toString方法
     *
     * @return
     */
    @Override
    public String toString() {
        return "Info{" +
                "loginId=" + loginId +
                ", loginName='" + loginName + '\'' +
                ", loginPassword='" + loginPassword + '\'' +
                '}';
    }
}
