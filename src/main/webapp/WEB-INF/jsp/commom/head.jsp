<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>Header</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script>
        $(function () {
            <!--  模糊查询 -->
            $("#search_sure").click(function () {
                var empName = $("#search").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/employee/employeeSearch?empName=" + empName,
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify(empName),
                    type: "POST",
                    success: function (data) {
                        if (data == 100) {
                            window.location.href = "${pageContext.request.contextPath}/employee/findAllList?condition=" + empName;
                        }
                    }
                })
            })
        })
    </script>
    <script>
        $(function () {
            <!--  登录退出 -->
            $("#logout").click(function () {
                $.ajax({
                    url: "${pageContext.request.contextPath}/employee/logout",
                    type: "POST",
                    data: JSON.stringify({}),
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: function (data) {
                        if (data == 100) {
                            window.location.href = "${pageContext.request.contextPath}/info/jumpLogin";
                        }
                    }
                })
            })
        })
    </script>


</head>
<body>
<div class="hrms_brand_nav">
    <nav class="navbar navbar-inverse navbar-static-top">
        <div class="container-fluid">
            <div class="navbar-header">

                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#hrms-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <img src="../static/img/logo.jpg" width="40px" height="35px"
                     style="border-radius: 150px"/>
            </div>

            <div class="collapse navbar-collapse" id="hrms-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="#">公司介绍 <span class="sr-only">(current)</span> </a>
                    </li>
                    <li><a href="#">人力资源部</a></li>
                    <li><a href="#">请假申请</a></li>
                    <li><a href="#">报销申请</a></li>
                    <li><a href="#">出勤记录</a></li>
                    <li><a href="${pageContext.request.contextPath}/file/fileToFileMain" id="fileMain">文件</a></li>
                </ul>

                <form class="navbar-form navbar-left" id="" onsubmit="return false" action="##" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" id="search" value="" placeholder="站内搜索">
                    </div>
                    <button type="button" class="btn btn-default" id="search_sure">搜索</button>
                </form>

                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">账号管理 <span class="caret"></span></a>
                        <ul class="dropdown-menu nav nav-pills nav-stacked">
                            <li class="active"><a href="#"><span class="glyphicon glyphicon-pencil"
                                                                 aria-hidden="true"></span> 修改信息</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 头像更换</a>
                            </li>
                            <li><a href="#" class="hrms_logout" id="logout"><span class="glyphicon glyphicon-off"
                                                                                  aria-hidden="true"></span> 账号退出</a>
                            </li>
                        </ul>
                    </li>
                </ul><!-- /.nav navbar-nav navbar-right -->
                <div style="float: right">
                    <ul class="nav navbar-nav">
                        <li><a href="#">欢迎您:${pageContext.request.session.getAttribute("username")}</a></li>
                    </ul>
                </div>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div><!-- /.hrms_brand_nav -->
