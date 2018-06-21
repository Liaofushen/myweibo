<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>weibo登录</title>
    <link rel="shortcunt icon" type="image/x-icon" href="../resources/static/images/favicon.ico">
    <link rel="stylesheet" href="/static/css/signin.css">
    <link rel="stylesheet" href="/static/css/jquery-labelauty.css">
</head>
<body>
<div class="wrap">
    <div class="logo">
        <h1>WEIBO</h1>
        <h2>与朋友一起，分享你的生活</h2>
    </div>
    <div class="box">
        <ul>
            <li>注册</li>
            <li class="selected">登录</li>

        </ul>
        <!-- sign up注册 -->
        <div id="signup" style="display:none">
            <div class="mail-inputbox inputbox">
                <input type="text" id="signup-userId" placeholder="用户名"/>
            </div>
            <div class="pw-inputbox inputbox">
                <input type="password" id="signup-userPassword" placeholder="密码"/>
            </div>
            <div class="pwc-inputbox inputbox">
                <input type="password" id="confirmpassword" placeholder="确认密码"/>
            </div>
            <div class="pwc-inputbox inputbox">
                <input type="text" id="signup-age" placeholder="输入年龄"/>
            </div>
            <div class="pwc-inputbox inputbox">
                <input type="text" id="signup-name" placeholder="输入名称"/>
            </div>
            <div>
                <ul class="dowebok">
                    <li><input type="radio" name="signup-userSex" value="0" checked/>男</li>
                    <li><input type="radio" name="signup-userSex" value="1"/>女</li>
                </ul>
            </div>
            <button id="signup-btn" class="up-btn">注册</button>
            <div style="margin-top: 10px">
                <h4 id="signup-hint">
                </h4>
            </div>
        </div>
        <!-- 登录 -->
        <div id="signin">
            <div class="mail-inputbox inputbox">
                <input type="text" id="signin-userId" placeholder="用户名"/>
            </div>
            <div class="pw-inputbox inputbox">
                <input type="password" id="signin-password" placeholder="密码"/>
            </div>
            <button id="signin-btn" class="up-btn">登录</button>
            <div style="margin-top: 10px">
                <h4 id="signin-hint">
                </h4>
            </div>
        </div>
    </div>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        // 选项表切换
        var box = document.getElementsByClassName('box')[0];
        var u = box.getElementsByTagName('li')[0];
        var i = box.getElementsByTagName('li')[1];
        i.onclick = function () {
            i.className = "selected";
            u.className = "";
            $("#signin").show();
            $("#signup").hide();

        };
        u.onclick = function () {
            u.className = "selected";
            i.className = "";
            $("#signup").show();
            $("#signin").hide();
        };
        // 登录
        $("#signin-btn").click(function () {
            $.post("/user/login", {userId: Number($("#signin-userId").val()), userPass: $("#signin-password").val()}, function (result) {
                if (result.status) {
                    window.location.href = "/main";
                }
                else {
                    $("#signin-hint").html(result.msg);
                }
            });
        });
        // 注册
        $("#signup-btn").click(function () {
            var sex = $('input[name="signup-userSex"]:checked').val();
            if (sex === "0") {
                sex = true;
            }
            else {
                sex = false;
            }
            var userId = Number($("#signup-userId").val());
            if (userId == null || isNaN(userId) || userId === 0) {
                alert("用户ID：请输入纯数字或至少输入1个非0数字");
                return;
            }
            var userPassword = $("#signup-userPassword").val();
            if (userPassword.length < 3) {
                alert("密码：请输入大于三位的密码");
                return;
            }
            var passwordAgain = $("#confirmpassword").val();
            if (passwordAgain !== userPassword) {
                alert("两次密码输入请保持一致");
                return;
            }
            var userAge = Number($("#signup-age").val());
            if (userAge == null || isNaN(userAge) || userAge === 0) {
                alert("年龄：请输入纯数字或至少输入1个非0数字");
                return;
            }
            var userName = $("#signup-name").val();
            if (userName.length < 3) {
                alert("姓名：请输入大于三位的名字");
                return;
            }
            $.post("/user/registerWithoutPhoto", {
                userId: userId, userPass: userPassword, userSex: sex,
                userAge: userAge, userName: userName
            }, function (result) {
                if (result.status) {
                    window.location.href = "/";
                }
                else {
                    $("#signup-hint").html(result.msg);
                }
            });
        });
    </script>
</div>
</body>
</html>
