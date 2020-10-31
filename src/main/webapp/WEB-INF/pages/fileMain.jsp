<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script>
        $(function () {
            $("#file_upload").click(function () {
                alert("hello")
                $.ajax({
                    url: "${pageContext.request.contextPath}/file/fileUpload1",
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(),
                    type: "POST",
                    success: function (data) {

                    }
                })
            })
        })

    </script>


    <script>
        function imageUpload() {
            var file1 = document.getElementById("file1");
            var ssFile = document.getElementById("ssFile");
            ssFile.value = file1.value.substring(12);
            $.ajaxFileUpload({
                url: '${pageContext.request.contextPath}/file/upload',
                fileElementId: 'file1',
                type: 'post',
                dataType: 'text',
                success: function (data, status) {
                    alert("文件上传成功");

                },
                error: function (data, status, e) {
                    alert("文件上传失败");
                }
            });
        }
    </script>
    <script>

        $(function () {
            $("#download").click(function () {
                window.location.href = "${pageContext.request.contextPath}/file/upload"
            })
        })
    </script>
</head>
<body>


<form method="post" action="${pageContext.request.contextPath}/file/fileUpload" enctype="multipart/form-data">
    选择文件<input type="file" name="upload"/>
    <input type="submit" value="上传文件">
</form>


<div>
    <button id="download">下载</button>
</div>


<br>


</body>
</html>
