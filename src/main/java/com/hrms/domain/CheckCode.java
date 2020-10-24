package com.hrms.domain;

import java.io.Serializable;

public class CheckCode extends Info implements Serializable {

    private String checkCode;


    public String getCheckCode() {
        return checkCode;
    }

    public void setCheckCode(String checkCode) {
        this.checkCode = checkCode;
    }

    @Override
    public String toString() {
        return "CheckCode{" +
                "checkCode='" + checkCode + '\'' +
                '}';
    }
}
