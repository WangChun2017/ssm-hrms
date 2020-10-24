<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工信息</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script>
        $(function () {
            $(".emp_delete_btn").click(function () {
                var empId = $(this).parent().parent().find("td:eq(0)").text();
                if (confirm("确认删除")) {
                    $.ajax({
                        url: "${pageContext.request.contextPath}/employee/deleteEmployee?deleteId=" + empId,
                        contentType: "application/json;charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify(empId),
                        type: "POST",
                        success: (function (data) {
                            if (data == 100) {
                                alert("删除失败");
                                window.location.href = "${pageContext.request.contextPath}/employee/findAllList";
                            } else {
                                alert("删除成功");
                                window.location.href = "${pageContext.request.contextPath}/employee/findAllList";
                            }
                        })
                    })
                }
            });
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
                        <li class="active">员工信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="emp_table">
                    <thead>
                    <th>员工编号</th>
                    <th>员工姓名</th>
                    <th>邮箱</th>
                    <th>性别</th>
                    <th>部门</th>
                    <th>操作</th>
                    </thead>
                    <tbody>
                    <c:forEach var="emp" begin="0" end="${psgMsg.list.size()-1}">
                        <tr>
                            <td>${psgMsg.list.get(emp).empId}</td>
                            <td>${psgMsg.list.get(emp).empName}</td>
                            <td>${psgMsg.list.get(emp).empEmail}</td>
                            <td>${psgMsg.list.get(emp).gender}</td>
                            <td>${psgMsg.list.get(emp).department.deptName}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/employee/employeeUpdate?empId=${psgMsg.list.get(emp).empId}"
                                   role="button"
                                   class="btn btn-primary emp_edit_btn" id="update">编辑</a>
                                <a href="#" role="button" class="btn btn-danger emp_delete_btn">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="panel-body">
                    <div class="table_items">
                        当前第<span class="badge">${psgMsg.currPage}</span>页，共有<span
                            class="badge">${psgMsg.totalPages}</span>页，总记录数<span
                            class="badge">${psgMsg.totalCount}</span>条。
                    </div>

                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <c:if test="${psgMsg.currPage == 1}">
                            <li class="page-item"><a class="page-link"
                                                     href="${pageContext.request.contextPath}/employee/findAllList?currentPage=${psgMsg.currPage}">Previous</a>
                            </li>
                        </c:if>
                        <c:if test="${psgMsg.currPage != 1 }">
                            <li class="page-item"><a class="page-link"
                                                     href="${pageContext.request.contextPath}/employee/findAllList?currentPage=${psgMsg.currPage-1}">Previous</a>
                            </li>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${psgMsg.totalPages}">
                            <c:if test="${psgMsg.currPage == i }">
                                <li class="page-item active"><a class="page-link active"
                                                                href="${pageContext.request.contextPath}/employee/findAllList?currentPage=${i}">${i}</a>
                                </li>
                            </c:if>
                            <c:if test="${psgMsg.currPage != i}">
                                <li class="page-item "><a class="page-link "
                                                          href="${pageContext.request.contextPath}/employee/findAllList?currentPage=${i}">${i}</a>
                                </li>
                            </c:if>

                        </c:forEach>
                        <c:if test="${psgMsg.currPage>=1 && psgMsg.currPage<psgMsg.totalPages}">
                            <li class="page-item"><a class="page-link"
                                                     href="${pageContext.request.contextPath}/employee/findAllList?currentPage=${psgMsg.currPage+1}">Next</a>
                            </li>
                        </c:if>
                        <c:if test="${ psgMsg.currPage==psgMsg.totalPages}">
                            <li class="page-item"><a class="page-link"
                                                     href="${pageContext.request.contextPath}/employee/findAllList?currentPage=${psgMsg.currPage}">Next</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->


    </div><!-- /.hrms_body -->
</div><!-- /.container -->

</body>
</html>
