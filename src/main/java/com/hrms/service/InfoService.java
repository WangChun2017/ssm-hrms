package com.hrms.service;

import com.hrms.domain.Info;

import java.util.List;

public interface InfoService {

    /**
     * 根据登录名和密码查询
     *
     * @param loginName
     * @param loginPassword
     * @return
     */
    public List<Info> findByNameAndPassword(String loginName, String loginPassword);

}
