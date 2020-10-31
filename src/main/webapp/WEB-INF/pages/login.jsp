<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录界面</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
    <script>
        function refreshCode() {
            var vcode = document.getElementById("vcode");
            vcode.src = "${pageContext.request.contextPath}/employee/checkCode?time=" + new Date().getTime();
        }
    </script>
    <script>
        $(function () {
            $("#login").click(function () {
                var loginName = $("#loginName").val();
                var loginPassword = $("#loginPassword").val();
                var checkCode = $("#checkCode").val();

                if (checkCode.length == 0) {
                    refreshCode();
                    alert("验证码不能为空");
                    return;
                }
                if (loginName.length == 0 || loginPassword.length == 0) {
                    alert("用户名或者密码不能为空");
                    refreshCode();
                    return;
                }
                $.ajax({
                    url: "${pageContext.request.contextPath}/info/loginInfo",
                    type: "POST",
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify({loginName: loginName, loginPassword: loginPassword, checkCode: checkCode}),
                    dataType: "json",
                    success: function (data) {
                        if (data == 100) {
                            alert("用户名或者密码错误");
                            refreshCode();
                            return;
                        } else if (data == 300) {
                            alert("验证码错误");
                            refreshCode();
                            return;
                        } else {
                            window.location.href = "${pageContext.request.contextPath}/info/jumpMain";
                        }


                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        console.log(XMLHttpRequest.status);
                        console.log(XMLHttpRequest.readyState);
                        console.log("error");
                        console.log(textStatus);
                        console.log(errorThrown);
                    }

                })
            });
        });


    </script>
</head>

<body>
<center>
    <br><br><br><br><br><br>

    <h1 style="color:black;">Login</h1>
    <br>
    <!-- -->
    <div name="" action="" method="post">
        <table Border="0">
            <tr>

                <td>账号</td>
                <td><input type="text" name="loginName" id="loginName"></td>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" name="loginPassword" id="loginPassword"></td>
            </tr>
            <tr>
                <td>验证码:</td>
                <td><input type="text" name="checkCode" id="checkCode"></td>
            </tr>
            <tr>
                <td></td>
                <td><a href="javascript:refreshCode()"><img src="${pageContext.request.contextPath}/employee/checkCode"
                                                            id="vcode"/></a></td>
                <%--                <td><a href="javascript:refreshCode()"></a></td>--%>
                <td></td>
            </tr>
        </table>
        <br>
        <input type="button" value="登录" style="color:#BC8F8F" id="login">

    </div>
</center>

<h3 style="text-align:center">${login_name_password_code}</h3>
</body>

</html>
