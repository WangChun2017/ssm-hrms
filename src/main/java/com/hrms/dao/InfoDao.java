package com.hrms.dao;


import com.hrms.domain.Info;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InfoDao {
    /**
     * 根据登录名和密码查询
     *
     * @param loginName
     * @param loginPassword
     * @return
     */
    public List<Info> findByNameAndPassword(String loginName, String loginPassword);
}
