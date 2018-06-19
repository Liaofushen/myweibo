<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>管理员后台首页</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container" id="div_head" style="display: none;">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <h3 class="text-center">
                博客后台系统
            </h3>
            <ul class="nav nav-tabs">
                <li>
                    <button id="button_manageruser">用户管理</button>
                </li>
                <li>
                    <button id="button_managernews">资讯管理</button>
                </li>

                <li>
                    <button id="button_createmanager">增加管理员</button>
                </li>
                <li>
                    <button id="button_logout">退出登录</button>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="container" id="div_login">
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
                            <button type="submit" class="btn btn-default" id="button_login">登录</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" id="div_createmanager" style="display: none">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div role="form"  style="margin-left: 400px;margin-top: 80px;">
                <div class="form-group">
                    <label>管理员账号：</label><input id="createmanagerid"  type="text" class="form-control" style="width:160px;display: inline-block"/>
                </div>
                <div class="form-group col-md-20">
                    <label>管理员密码：</label><input  id="createmanagerpwd" type="password" class="form-control" style="width:100px;display: inline-block"/>
                </div>
                <button type="submit" class="btn btn-default" style="text-align: center" id="add_createmanager">增加</button>
            </div>
        </div>
    </div>
</div>
<div class="container" id="div_managernews" style="display: none">
    <div class="row clearfix">
        <div class="col-md-12 column" id="div_shownews">
        </div>
    </div>
</div>
<div class="container" id="div_manageruser" style="display: none">
    <div class="row clearfix">
        <div class="col-md-12 column" id="div_showuser">

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
    $(document).ready(function () {
        $.get(
            "/news/all",
            function (data) {
                var htm = "<table class=\"table table-bordered\"><thead><tr><th>微博内容</th><th>微博发布时间</th><th>微博Id</th></tr></thead><tbody>";
                var item = data.data;
                console.log(item);
                for (var i = 0; i < item.length; i++) {
                    htm += '<tr><td>' + item[i].newsText + '</td><td>'
                        + item[i].newsTime + '</td><td>'
                        + item[i].newsId + '</td><td>'
                        + '<td> <button type="button" class="btn btn-sm" onclick="deletenews(' + item[i].newsId + ')">删除 </button></td>';
                }
                htm += '</tr></tbody></table>';
                $("#div_shownews").append(htm);
            });
        $.get(
            "/user/all",
            function (data) {
                var htm = "<div class=\"navbar-form navbar-left\" role=\"search\"><div class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"username\"/></div><button type=\"submit\" class=\"btn btn-default\">搜索</button></div>";
                htm += "<table class=\"table table-bordered\"><thead><tr><th>用户名</th><th>昵称</th><th>性别</th><th>年龄</th><th>加入微博时间</th></tr></thead><tbody>";
                var item = data.data;
                console.log(item);
                for (var i = 0; i < item.length; i++) {
                    htm += '<tr><td>' + item[i].userId + '</td><td>'
                        + item[i].userName + '</td><td>'
                        + item[i].userSex + '</td><td>'
                        + item[i].userAge + '</td><td>'
                        + item[i].userTime + '</td><td>'
                        + '<td> <button type="button" class="btn btn-sm" onclick="deleteuser('+ item[i].userId + ')">删除 </button></td>';
                }
                htm += '</tr></tbody></table>';
                $("#div_showuser").append(htm);
            });
        $("#button_login").click(function () {
            $.post(
                "/manager/login",
                {
                    managerId: $("#managerid").val().toString().trim(),
                    managerName: null,
                    managerPass: $("#managerpwd").val().toString().trim()
                },
                function (result) {
                    if(result.status){
                        $("#div_login").hide();
                        $("#div_head").show();
                    }
                });
        });
        $("#button_logout").click(function () {
            $("#div_managernews").hide();

            $("#div_manageruser").hide();
            $("#div_createmanager").hide();
            $("#div_head").hide();
            $("#div_login").show();
        });
        $("#button_managernews").click(function () {
            $("#div_managernews").show();

            $("#div_manageruser").hide();
            $("#div_createmanager").hide();
        });

        $("#button_manageruser").click(function () {
            $("#div_managernews").hide();

            $("#div_manageruser").show();
            $("#div_createmanager").hide();
        });
        $("#button_createmanager").click(function () {
            $("#div_managernews").hide();

            $("#div_manageruser").hide();
            $("#div_createmanager").show();
        });
        $("#add_createmanager").click(function () {
            $.post(
                "/manager/register",
                {
                    managerId: $("#createmanagerid").val().toString().trim(),
                    managerName: null,
                    managerPass: $("#createmanagerpwd").val().toString().trim()
                },
                function (result) {
                    if (result.status) {
                        alert("添加成功");
                    }
                });
        });
    });

    function deletenews(newsid) {
        window.location.href = "/news/delete/" + newsid;
    }
    function deleteuser(managerid) {
        window.location.href = "/user/delete/" + managerid;
    }
</script>
</body>
</html>
