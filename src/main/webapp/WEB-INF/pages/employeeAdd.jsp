<%--
  Created by IntelliJ IDEA.
  User: 86150
  Date: 2020/10/23
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>

    <script>
        $(function () {
            $("#add_employee").click(function () {

                var departmentId = $("#select").find('option:selected').val();

                var gender = $('input:radio[name="gender"]:checked').val();


                var empName = $("#add_name").val();
                if (empName.length == 0) {
                    alert("用户名不能为空");
                    return;
                }
                var empEmail = $("#add_email").val();
                if (empEmail.length == 0) {
                    alert("邮箱不能为空");
                    return;
                }
                $.ajax({
                    url: "${pageContext.request.contextPath}/employee/employeeAdd",
                    type: "POST",
                    data: JSON.stringify({
                        empName: empName,
                        empEmail: empEmail,
                        gender: gender,
                        departmentId: departmentId
                    }),
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        if (data == 200) {
                            alert("添加成功")
                            window.location.href = "${pageContext.request.contextPath}/employee/findAllList";
                        } else if (data == 100) {
                            alert("添加失败")
                            window.location.href = "${pageContext.request.contextPath}/employee/toEmployeeAdd"
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
<div class="hrms_container">
    <!-- 导航条 -->
    <%--    <%@ include file="./commom/head.jsp"%>--%>
    <%@ include file="/WEB-INF/jsp/commom/head.jsp" %>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="hrms_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%--        <%@ include file="./commom/leftsidebar.jsp"%>--%>
        <%@ include file="/WEB-INF/jsp/commom/leftsidebar.jsp" %>
        <!-- 中间员工表格信息展示内容 -->
        <div class="emp_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">员工管理</a></li>
                        <li class="active">员工更新</li>

                    </ol>
                </div>
                <!-- Table -->

                <div>
                    <table class="table table-bordered table-hover" id="emp_table" style="text-align: center">

                        <tr>
                            <td>员工姓名</td>
                            <td><input id="add_name" style="text-align: center;border: 0 " type="text"
                                       name="empName" value="" placeholder="请输入姓名"/>
                            </td>
                        </tr>
                        <tr>
                            <td>员工邮箱</td>
                            <td><input id="add_email" style="text-align: center; border: 0" type="text"
                                       name="empEmail" value="" placeholder="请输入邮箱"/>
                            </td>
                        </tr>

                        <tr>
                            <td>性别</td>

                            <td>
                                <input type="radio" style="text-align: center" name="gender" value="男" checked/>男生
                                <input type="radio" style="text-align: center" name="gender" value="女"/>女生
                        </tr>
                        <tr>
                            <td>部门</td>
                            <td>
                                <select id="select" name="empDepartmentId">
                                    <option style="text-align: center" value="1" name="游戏部">游戏部</option>
                                    <option style="text-align: center" value="2" name="法考部">法考部</option>
                                    <option style="text-align: center" value="3" name="技术部">技术部</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                    <button role="button" class="btn btn-danger emp_add_btn" id="add_employee">保存</button>
                </div>
            </div>
        </div><!-- /.panel panel-success -->
    </div><!-- /.emp_info -->
</div><!-- /.hrms_body -->

</body>
</html>
