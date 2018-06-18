<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>用户管理</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column" id="div">

        </div>
    </div>
</div>
<script>
    //冻结
    function freeze(username) {
        var result =prompt("请输入冻结原因：");
        window.location.href = "/manager/freeze?username=" + username + "&freezeresult=" + result;
    }
    //解冻
    function unfreeze(username) {
        window.location.href = "/manager/unfreeze?username=" + username;
    }
</script>
<script>
    $(document).ready(function (){
        $.get(
            "http://localhost:8080",
            function (data) {
                var htm = "<div class=\"navbar-form navbar-left\" role=\"search\"><div class=\"form-group\"><input type=\"text\" class=\"form-control\" name=\"username\"/></div><button type=\"submit\" class=\"btn btn-default\">搜索</button></div>";
                htm += "<table class=\"table table-bordered\"><thead><tr><th>用户名</th><th>性别</th><th>状态</th><th>原因</th><th>管理员</th><th  colspan=\"2\" style=\"align: center\">操作</th></tr></thead><tbody>";
                var item = data.data;
                console.log(item);
                for (var i = 0; i < item.length; i++) {
                    htm += '<tr><td>' + item[i].userId + '</td><td>'
                        + item[i].userName + '</td><td>'
                        + item[i].userPass + '</td><td>'
                        + '<td> <button type="button" class="btn btn-sm">删除 </button></td>';
                }
                htm += '</tr></tbody></table>';
                $("#div").append(htm);
            });
    });
    $(document).ready(function () {
        $("button").click(function () {

        });
    });
</script>
</body>
</html>
