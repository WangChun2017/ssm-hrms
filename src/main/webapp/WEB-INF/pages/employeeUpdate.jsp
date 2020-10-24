<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>

    <script>
        $(function () {
            var deptName;
            var selectId = document.getElementById("select");
            for (var i = 0; i < selectId.options.length; i++) {
                if ((${list.get(0).departmentId}) == selectId.options[i].value) {
                    selectId.options[i].selected = 'selected';
                    deptName = $("#select").find('option:selected').text();
                }
            }
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

                <form id="update_form" method="post" action="${pageContext.request.contextPath}/employee/finialUpdate">
                    <table class="table table-bordered table-hover" id="emp_table" style="text-align: center">
                        <tr>
                            <td>员工编号</td>
                            <td><input style="text-align: center;border: 0 " type="text"
                                       name="empId" value="${list.get(0).empId}" readonly="readonly"/>
                            </td>
                        </tr>
                        <tr>
                            <td>员工姓名</td>
                            <td><input style="text-align: center;border: 0 " type="text"
                                       name="empName" value="${list.get(0).empName}"/>
                            </td>
                        </tr>
                        <tr>
                            <td>员工邮箱</td>
                            <td><input style="text-align: center; border: 0" type="text"
                                       name="empEmail" value="${list.get(0).empEmail}"/>
                            </td>
                        </tr>

                        <tr>
                            <td>性别</td>
                            <c:if test="${list.get(0).gender.equals('男')}">
                            <td>
                                <input type="radio" style="text-align: center" name="gender" value="男" checked/>男生
                                <input type="radio" style="text-align: center" name="gender" value="女"/>女生
                                </c:if>
                                <c:if test="${list.get(0).gender.equals('女')}">
                            <td>
                                <input type="radio" style="text-align: center" name="gender" value="男"/>男生
                                <input type="radio" style="text-align: center" name="gender" value="女" checked/>女生
                                </c:if>
                            </td>
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
                    <input type="submit" value="确认修改" id="update" style="text-align: center"/>
                </form>
            </div>
        </div><!-- /.panel panel-success -->
    </div><!-- /.emp_info -->


</div><!-- /.hrms_body -->


</body>
</html>
