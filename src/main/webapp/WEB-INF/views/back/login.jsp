<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>博客后台登录界面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                博客后台登录界面
            </h3>
            <div style="width: 250px;margin: 100px auto">
                <div class="form-horizontal" role="form">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <label>管理员账号：</label>
                            <input id="managerid" type="text" class="form-control" placeholder="请输入用户名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-10">
                            <label>管理员密码：</label>
                            <input id="managerpwd" type="password" class="form-control" placeholder="请输入密码"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox"><label><input type="checkbox"/>记住密码</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">登录</button>
                        </div>
                    </div>
                </div>
                <c:if test="${loginMesg!=null}">
                    <div class="alert alert-dismissable alert-warning">
                        <h4>
                            注意!
                        </h4>
                            ${loginMesg}
                    </div>
                </c:if>
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
</body>
</html>
