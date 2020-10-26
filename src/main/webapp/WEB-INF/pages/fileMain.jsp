<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<form method="post" action="${pageContext.request.contextPath}/file/fileUpload" enctype="multipart/form-data">
    选择文件<input type="file" name="upload"/>
    <input type="submit" value="上传文件">
</form>




<div>
    <button>文件下载</button>
</div>


</body>
</html>
