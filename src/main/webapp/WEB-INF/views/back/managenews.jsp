<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>资讯管理</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column" id="div">
        </div>
    </div>
</div>
<script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js">
</script>
<script>
    $(document).ready(function (){
        $.get(
            "http://localhost:8080",
            function (data, status) {
                var htm = "<table class=\"table table-bordered\"><thead><tr><th>用户名称</th><th>权限</th><th>内容</th></tr></thead><tbody>";
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
