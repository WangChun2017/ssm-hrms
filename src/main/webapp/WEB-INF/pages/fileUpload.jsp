<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>

    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <%--    <script>--%>
    <%--        function toload() {--%>
    <%--            // var fileName = $("#name").text();--%>
    <%--            var fileName = $(".hidden").text();--%>
    <%--            alert(fileName)--%>
    <%--            $.ajax({--%>
    <%--                url: "${pageContext.request.contextPath}/file/fileDownload?filename=" + fileName,--%>
    <%--                contentType: "application/json;charset=utf-8",--%>
    <%--                dataType: "json",--%>
    <%--                data: JSON.stringify(fileName),--%>
    <%--                type: "POST",--%>
    <%--                success: function (data) {--%>
    <%--                    if (data == 200) {--%>
    <%--                        alert(data)--%>
    <%--                        window.location.href = "${pageContext.request.contextPath}/info/jumpLogin";--%>
    <%--                    }--%>
    <%--                }--%>
    <%--            })--%>
    <%--        }--%>
    <%--    </script>--%>

    <%--    <script>--%>
    <%--        function downloadFileByForm() {--%>
    <%--            console.log("ajaxDownloadSynchronized");--%>
    <%--            var url = "${pageContext.request.contextPath}/file/fileTest";--%>
    <%--            var fileName = "0d8e7525cce64464a7a3c96d6ce45e29_head.jpg";--%>
    <%--            var form = $("<form></form>").attr("action", url).attr("method", "post");--%>
    <%--            form.append($("<input></input>").attr("type", "hidden").attr("name", "fileName").attr("value", fileName));--%>
    <%--            form.appendTo('body').submit().remove();--%>
    <%--        }--%>
    <%--    </script>--%>
</head>
<body>

<%--<div>--%>
<%--    <a href="<%=request.getContextPath()%>/ajaxDownloadServlet.do?fileName=testAjaxDownload.txt">同步下载文件</a><br/>--%>
<%--    <a href="#" onclick="downloadFilebyAjax()">ajax下载文件</a> <br/>--%>
<%--    <a href="#" onclick="downloadFileByForm()">模拟表单提交下载文件</a>--%>
<%--</div>--%>


<form method="post" action="##" enctype="multipart/form-data" onsubmit="return false">
    <table>
        <tr>
            <td>
                <img src="${pageContext.request.contextPath}/chart/${list.get(0)}">
            </td>
            <td class="hidden">${list.get(0)}</td>
            <td><a href="${pageContext.request.contextPath}/file/fileDownload?filename=${list.get(0)}">下载</a></td>
        <tr>
    </table>
</form>

<%--<table style="text-align: center">--%>
<%--    <c:forEach var="i" begin="0" end="${list.size()-1}">--%>
<%--        <tr style="text-align: center">--%>
<%--            <td style="text-align: center">--%>
<%--                <img src="${pageContext.request.contextPath}/chart/${list.get(i)}" alt="123" width="60px"--%>
<%--                     height="60px">--%>
<%--            </td>--%>
<%--            <td id="name" class="hidden">${list.get(i)}</td>--%>
<%--            <td><a onclick="toload()" href="##" >下载</a></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
</body>
</html>
