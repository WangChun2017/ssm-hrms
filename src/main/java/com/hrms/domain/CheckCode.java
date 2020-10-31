package com.hrms.domain;

import java.io.Serializable;

public class CheckCode extends Info implements Serializable {

    private String checkCode;

    private String fileName;

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

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
                ", fileName='" + fileName + '\'' +
                '}';
    }
}
