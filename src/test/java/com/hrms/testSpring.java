package com.hrms;

import com.hrms.service.EmployeeService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class testSpring {
    @Test
    public void testFindAll(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("ApplicationContext.xml");

        EmployeeService employee = (EmployeeService) context.getBean("employee");

        employee.findAll();

    }
}
