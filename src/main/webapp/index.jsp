
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<h1 style="text-align: center">主页</h1>
<h3 style="text-align: center"><a href="info/jumpLogin">登录</a></h3>

<h3 ><a href="employee/employeeUpdate">一对一查询</a></h3>


<form method="post" action="${pageContext.request.contextPath}/file/fileUpload" enctype="multipart/form-data">
    选择文件<input type="file" name="upload"/>
    <input type="submit" value="上传文件">
</form>

</body>
</html>
