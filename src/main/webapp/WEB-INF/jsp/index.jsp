<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>菜鸟教程(runoob.com)</title>
    <script src="https://cdn.bootcss.com/jquery/1.10.2/jquery.min.js">
    </script>
    <script>
        $(document).ready(function () {
            $("button").click(function () {
                $.get(
                    "http://localhost:8080/user/all",
                    function (data, status) {
                        //console.log(data);
                        var htm = "<br><br>------------------------------------------------------------<br>";
                        htm += "status: " +  data.status + "<br>";
                        htm += "msg : " + data.msg + "<br>";
                        htm += "data: " + "<br>";
                        htm += "<table><thead><tr><th>userId</th><th>userName</th><th>userPass</th></tr></thead><tbody>";

                        var item = data.data;
                        console.log(item);

                        for (var i = 0; i < item.length; i++) {

                            //console.log(item[i].name);

                            htm += '<tr><td>' + item[i].userId + '</td><td>'
                                + item[i].userName + '</td><td>'
                                + item[i].userPass + '</td><td>';
                        }
                        htm += '</tbody></table>';
                        $("#div").append(htm);
                    });
            });
        });
    </script>
</head>
<body>

<button>查看所有学生</button>
<div id="div">

</div>
</body>
</html>