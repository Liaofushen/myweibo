<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>新增管理员</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h2 class="text-center">
                录入管理员信息
            </h2>
        </div>
    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div role="form"  style="margin-left: 400px;margin-top: 80px;">
                <div class="form-group">
                    <label>管理员账号：</label><input id="managerid"  type="text" class="form-control" style="width:160px;display: inline-block"/>
                </div>
                <div class="form-group col-md-20">
                    <label>管理员密码：</label><input  id="managerpwd" type="password" class="form-control" style="width:100px;display: inline-block"/>
                </div>
                <div class="from-group col-md-20">
                    <label>权限：</label>
                    <input type="radio" value="1"/> 用户管理员
                    <input type="radio" value="2"/> 资讯管理员
                </div>
                <button type="submit" class="btn btn-default" style="text-align: center">增加</button>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js">
</script>
<script>
    $(document).ready(function () {
            $("button").click(function () {
                $.post(
                    "http://localhost:8080",
                    {
                        id: $("#managerid").value().toString().trim(),
                        pwd: $("#managerpwd").value().toString().trim()
                    },
                    function (data, status) {

                    });
            });
        });
</script>
</body>
</html>
