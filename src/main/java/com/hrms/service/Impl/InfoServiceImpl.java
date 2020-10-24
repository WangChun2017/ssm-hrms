package com.hrms.service.Impl;

import com.hrms.dao.InfoDao;
import com.hrms.domain.Info;
import com.hrms.service.InfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class InfoServiceImpl implements InfoService {

    @Autowired
    private InfoDao infoDao;


    /**
     * 根据登录名和密码查询
     *
     * @param loginName
     * @param loginPassword
     * @return
     */
    @Override
    public List<Info> findByNameAndPassword(String loginName, String loginPassword) {
        return infoDao.findByNameAndPassword(loginName, loginPassword);
    }
}
