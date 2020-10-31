<%--
  Created by IntelliJ IDEA.
  User: 86150
  Date: 2020/10/13
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h3>测试成功</h3>

<c:forEach items="${list}" var="employee">
    ${employee.empId}----${employee.empName}----${employee.empEmail}----${employee.gender}----${employee.departmentId}
</c:forEach>


<%--<img src="${pageContext.request.contextPath}/fileviewImage?path=${files.fileUrl}">--%>


${fileList}

<img src="${pageContext.request.contextPath}/chart/${fileName}" alt="123" width="60px" height="60px">
<br>
<a id="download">下载</a>
${fileUrl}${fileName}
</body>
</html>
