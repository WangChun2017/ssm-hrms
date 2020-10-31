package com.hrms;

import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class fileTest {

    @Test
    public List<String> allFileUploadName() {
        List<String> list = new ArrayList<String>();
        String path = "target\\ssm-hrms\\upload";

        File file = new File(path);
        File[] files = file.listFiles();
        for (File file1 : files) {

            String[] splits = file1.toString().split("\\\\");
            for (int i = 0; i < splits.length; i++) {
                if (i == splits.length - 1) {

                    list.add(splits[i]);
                    System.out.println(splits[i]);
                    System.out.println("======================================s" + list.toString());
                }
            }
        }
        return list;
    }


}
