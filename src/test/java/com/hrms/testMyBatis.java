package com.hrms;

import com.hrms.dao.EmployeeDao;
import com.hrms.domain.Employee;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class testMyBatis {

    @Test
    public void testByBatis() throws IOException {
        InputStream is = Resources.getResourceAsStream("SqlMapConfig.xml");

        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
        SqlSession session = factory.openSession();
        EmployeeDao dao = session.getMapper(EmployeeDao.class);
        List<Employee> lists = dao.findAll();
        for (Employee list : lists) {
            System.out.println(list);
        }
    }
}
