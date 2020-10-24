<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>

<head>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script>

    </script>
</head>
<body>
<div class="panel-group col-sm-2" id="hrms_sidebar_left" role="tablist" aria-multiselectable="true">
    <ul class="nav nav-pills nav-stacked emp_sidebar">
        <li role="presentation" class="active">
            <a href="#" data-toggle="collapse" data-target="#collapse_emp">
                <span class="glyphicon glyphicon-user" aria-hidden="true">员工管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_emp">
                <li role="presentation"><a href="#" class="emp_info">员工信息</a></li>
                <li role="presentation"><a href="#" role="button" class="emp_add_btn" data-toggle="modal"
                                           data-target=".emp-add-modal">员工新增</a></li>
                <li role="presentation"><a href="#" class="emp_clearall_btn">员工清零</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#" data-toggle="collapse" data-target="#collapse_dept">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true">部门管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_dept">
                <li role="presentation"><a href="#" class="dept_info">部门信息</a></li>
                <li role="presentation"><a href="#" class="dept_add_btn" data-toggle="modal"
                                           data-target=".dept-add-modal">部门新增</a></li>
                <li role="presentation"><a href="#" class="dept_clearall_btn">部门清零</a></li>
            </ul>
        </li>
    </ul>

</div>
<!-- /.panel-group，#hrms_sidebar_left -->
<script>
    $(".emp_info").click(function () {
        $(this).attr("href", "${pageContext.request.contextPath}/employee/findAllList");
    });

    $(".emp_add_btn").click(function () {
        window.location.href = "${pageContext.request.contextPath}/employee/toEmployeeAdd";
    })
</script>

</body>
</html>