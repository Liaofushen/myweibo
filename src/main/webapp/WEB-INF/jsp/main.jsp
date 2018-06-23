<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache">

    <title>首页</title>
    <link rel="shortcunt icon" type="/image/x-icon" href="/static/images/favicon.ico">
    <link rel="stylesheet" href="/static/css/common.css">
    <link type="text/css" rel="stylesheet" href="/static/css/index.css">
    <style>
        .main-nav {
            width: 624px;
            list-style-type: none;
            margin: 0 0 20px 0;
            padding: 0;
            overflow: hidden;
            background-color: #333333;
            border-radius: 5px;
        }
        .nav-item {
            float: left;
        }
        .setting-Nav {
            float: right;
        }
        a {
            cursor: pointer;
        }
        .nav-item a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 25px 14px 25px;
            text-decoration: none;
        }
        .nav-item a:hover {
            background-color: #111;
        }
        .user-box-item {
            cursor: pointer;
            width: 624px;
            background-color: #0f0f0f;
            border-radius: 5px;
            height: 70px;
            margin-top: 20px;
            position: relative;
            box-shadow: 0px 3px 6px rgba(35, 35, 36, 0.75);
        }
        .user-box-item img {
            float: left;
            width: 50px;
            height: 50px;
            margin: 10px;
        }
        .user-box-item div {
            margin-left: 80px;
            width: 200px;
            height: 70px;
            line-height: 70px;
            font-size: 30px;
        }
        #settingDIV {
            width: 624px;
        }
        #setting-Inner {
            width: 100%;
            text-align: center;
            box-shadow: 0px 3px 6px rgba(35, 35, 36, 0.75);
            background-color: #0f0f0f;
            border-radius: 5px;
        }
        #changePasswordDIV {
            width: 628px;
        }
        #changePassword-Inner {
            width: 100%;
            text-align: center;
            box-shadow: 0px 3px 6px rgba(35, 35, 36, 0.75);
            background-color: #0f0f0f;
            border-radius: 5px;
        }
        .up-btn{
            cursor: pointer;
            padding: 0;
            font-size: 18px;
            margin-top: 22px;
            width: 320px;
            height: 42px;
            background: #1a910a;
            border-radius: 4px;
            text-align: center;
            color: #FFF;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="headerbar">
        <h1 class="logo">
            <a href="index">微博系统</a>
        </h1>
        <div class="publish">
            <a href="javascript:void(0);">发布</a>
        </div>
        <div class="nav">
            <ul>
                <!--<li>
                    <form action="/search" method="post">
                        <input type="text" name="search"/>
                        <input type="submit" value="搜索" style="height: 25px"/>
                    </form>
                </li>-->
                <li>
                    <a>私信</a>
                    <div class="num">6</div>
                </li>
                <li>
                    <a>通知</a>
                    <div class="num">14</div>
                </li>
                <li class="account">
                    <h3><a href="/main">${sessionScope.user.userName}</a></h3>
                    <div class="account-panel">
                        <ul>
                            <li class="panel1" onclick="showDivAndHideOther(4)"><a>设置</a></li>
                            <li class="panel2"><a href="/user/logout">退出</a></li>
                            <li class="panel2" onclick="showDivAndHideOther(5)"><a>更改密码</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="main">
    <div class="main-nav">
        <div onclick="showDivAndHideOther(0)" class="nav-item"><a>主页</a></div>
        <div onclick="showDivAndHideOther(1)" class="nav-item"><a>粉丝</a></div>
        <div onclick="showDivAndHideOther(2)" class="nav-item"><a>关注</a></div>
        <div onclick="showDivAndHideOther(3)" class="nav-item"><a>说说</a></div>
        <div class="nav-item setting-Nav" onclick="showDivAndHideOther(4)"><a>设置</a></div>
        <div class="nav-item setting-Nav" onclick="showDivAndHideOther(5)"><a>更改密码</a></div>
    </div>
    <div style="display: none;" id="mainDIV" class="content"></div>
    <div style="display: none;" id="followedDIV"></div>
    <div style="display: none;" id="followingDIV"></div>
    <div style="display: none;width: 624px;height: 1000px;" id="publishDIV"></div>
    <div style="display: none;" id="settingDIV">
        <br />
        <h2 style="color: #333;">设置</h2><br />
        <div id="setting-Inner">
            <br />
            <div>
                <span class="input-group-addon">名称</span>
                <input type="text" class="form-control" id="setting-Name" value="${sessionScope.user.userName}">
            </div><br />
            <div>
                <span class="input-group-addon">年龄</span>
                <input type="text" class="form-control" id="setting-Age" value="${sessionScope.user.userAge}">
            </div><br />
            <div>
                <input id="setting-SexFirst" type="radio" name="setting-Sex" value="0"/><label for="setting-SexFirst">男</label>
                <input id="setting-SexSecond" type="radio" name="setting-Sex" value="1"/><label for="setting-SexSecond">女</label>
            </div>
            <button onclick="doSaveUserInfo()" class="up-btn">保存信息</button><br /><br /><br />
        </div>
    </div>
    <div style="display: none;"  id="changePasswordDIV">
        <br />
        <h2 style="color: #333;">更改密码</h2><br />
        <div id="changePassword-Inner">
            <br />
            <div>
                <span>旧 密 码</span>
                <input type="text" class="form-control" id="changePassword-Old">
            </div><br />
            <br />
            <div>
                <span>新 密 码</span>
                <input type="text" class="form-control" id="changePassword-New">
            </div><br />
            <br />
            <div>
                <span>再次输入</span>
                <input type="text" class="form-control" id="changePassword-NewAgain">
            </div><br />
            <button onclick="doChangePassword()" class="up-btn">更改密码</button><br /><br /><br />
        </div>
    </div>
</div>
<div class="p-info">
    <div class="p-icon">
        <img src="/photo/${sessionScope.user.userPhoto}" alt="picon" style="width: 100px;height: 100px">
    </div>
    <div class="p-name"><a>${sessionScope.user.userName}</a></div>
    <div class="p-profile">
        <ul>
            <li><a onclick="showDivAndHideOther(1)">
                <span>粉丝</span>
                <span id="numberOfFollowed" class="p-followed">--</span>
            </a></li>
            <li><a onclick="showDivAndHideOther(2)">
                <span>关注</span>
                <span id="numberOfFollowing" class="p-following">--</span>
            </a></li>
            <li><a onclick="showDivAndHideOther(3)">
                <span>说说</span>
                <span id="numberOfPublish" class="p-publish">--</span>
            </a></li>
        </ul>
    </div>
</div>
</div>
<a id="gotop" href="#">回到顶部</a>
<!-- 发布布局 -->
<div class="opacity-bg" style="display:none"></div>
<div class="post" style="display:none;top:100px;left:200px;">
    <div class="post-title">说点什么</div>
    <div class="post-close">关闭</div>
    <div class="post-input">
        <div>
            <textarea id="publishNewsText" name="newstext"></textarea>
            <input id="publishPhoto" type="file" class="file" name="photo" accept="image/jpeg"/>
            <button onclick="onPublish();" class="post-btn">提 交</button>
        </div>
    </div>
</div>

<script type="text/javascript" src="/static/js/publish.js"></script>
<script type="text/javascript" src="/static/js/index.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    var fanArray;
    var attentionArray;
    var newsArray;
    var divArray = [$("#mainDIV"), $("#followedDIV"), $("#followingDIV"), $("#publishDIV"), $("#settingDIV"), $("#changePasswordDIV")];
    var showDivAndHideOther = function(index) {
        (function () {
            var userSex = ${sessionScope.user.userSex};
            if (userSex) {
                $("#setting-SexFirst").attr("checked", "checked");
            }
            else {
                $("#setting-SexSecond").attr("checked", "checked");
            }
        })();
        divArray.forEach(function (value, index2, array) {
            if (index2 !== index) {
                value.hide();
                $(".nav-item").eq(index2).css("background-color", "#333333");
            }
            else {
                value.show();
                $(".nav-item").eq(index2).css("background-color", "#555555");
            }
        });
    };
    var doChangePassword = function () {
        var changePasswordOld = $("#changePassword-Old").val();
        var changePasswordNew = $("#changePassword-New").val();
        var changePasswordNewAgain = $("#changePassword-NewAgain").val();
        if (changePasswordOld.length < 3 || changePasswordNew.length < 3) {
            alert("情保证输入的长度大于3。");
        }
        if (changePasswordNew !== changePasswordNewAgain) {
            alert("请保证两次密码输入一致。")
        }
        var changePasswordJSON = {userId: ${sessionScope.user.userId}, oldUserPass: changePasswordOld, userPass: changePasswordNew};
        console.log(changePasswordJSON);
        $.post("/user/update", changePasswordJSON, function (result) {
            if (result.status) {
                alert("更改密码成功。");
            }
            else {
                alert(result.msg);
            }
        });
    };
    var doSaveUserInfo = function () {
        var settingName = $("#setting-Name").val();
        if (settingName.length < 3) {
            alert("姓名：请输入大于三位的名字");
            return;
        }
        var settingAge = Number($("#setting-Age").val());
        if (settingAge == null || isNaN(settingAge) || settingAge === 0) {
            alert("年龄：请输入纯数字或至少输入1个非0数字");
            return;
        }
        var sex;
        if ($('input[name="setting-Sex"]:checked').val() === "0") {
            sex = true;
        }
        else {
            sex = false;
        }
        var settingJSON = {
            userName: settingName, userAge: settingAge, userSex: sex, usePass: ${sessionScope.user.userPass}, userId: ${sessionScope.user.userId},
            photo: null
        };
        console.log(settingJSON);
        $.post("/user/update", settingJSON, function (result) {
            if (result.status) {
                alert("修改成功。");
            }
            else {
                alert(result.msg);
            }
        });
    };
    $(document).ready(function () {
        $(".nav-item").eq(0).click();
        var userId = ${sessionScope.user.userId};
        $.get("/user/fans/" + userId, function (result) {
            if (result.status) {
                fanArray = result.data;
                $("#numberOfFollowed").html(result.data.length);
                var followedDIV = $("#followedDIV");
                for (var i = 0; i < fanArray.length; i++) {
                    followedDIV.append("<div class='user-box-item'><img src='./images/user3.png'/><div>" + fanArray[i].userName + "</div></div>");
                }
                if (fanArray.length === 0) {
                    followedDIV.append("<br /><h2 style='color: #333;'>该用户暂无粉丝。</h2>");
                }
            }
        });
        $.get("/user/attention/" + userId, function (result) {
            if (result.status) {
                attentionArray = result.data;
                $("#numberOfFollowing").html(result.data.length);
                var followedDIV = $("#followingDIV");
                for (var i = 0; i < attentionArray.length; i++) {
                    followedDIV.append("<div class='user-box-item'><img src='./images/user3.png'/><div>" + attentionArray[i].userName + "</div></div>");
                }
                if (attentionArray.length === 0) {
                    followedDIV.append("<br /><h2 style='color: #333;'>该用户暂无关注。</h2>");
                }
            }
        });
        $.get("/news/user/" + userId, function (result) {
            if (result.status) {
                newsArray = result.data;
                $("#numberOfPublish").html(result.data.length);
                getAndShowNews(result, $("#publishDIV"));
            }
        });
        $.get("/news/all", function (result) {
            if (result.status) {
                for (var i = 0; i < result.data.length; i++) {
                    var item = $("<div class='item'></div>");
                    var itemMain = $("<div class='item-main'></div>");
                    var uInfo = $(
                        "<div class=\"u-info\"><div class=\"u-icon\">" +
                        "<img src=\"/photo/" + result.data[i].user.photo + "\" alt=\"IVEN-木罐\" style=\"height:60px;width: 60px;\"/>" +
                        "</div>" +
                        "<div class=\"name-pub\">" +
                        "<div class=\"u-name\">" + "<a href=\"\">" + result.data[i].user.userName + "</a>" + "</div>" +
                        "<div class=\"u-pub\">" + result.data[i].newsTime + "</div>" +
                        "</div>" +
                        "</div>"
                    );
                    var itemContent = $("<div class=\"itemcontent\"></div>");
                    if (result.data[i].newsPhoto != null) {
                        itemContent.append("<div class=\"thumbnail\">" +
                            "<img src=\"/photo/" + result.data[i].newsPhoto + "\" alt=\"img1\" style=\"width:100px;height: 100px;\"/>" +
                            "</div>");
                    }
                    itemContent.append("<div class=\"full-text\">" +
                        "<p>" + result.data[i].newsText + "</p></div>");
                    var uList = $("<div class=\"u-list\">" +
                        "<ul>" +
                        "<li>" +
                        "<a onclick=\"comment('" + result.data[i].newsId + "')\" class=\"arrow-warp\">" +
                        "<span>评论</span><span id='commentId" + result.data[i].newsId + "Number'>" + result.data[i].comments.length +"</span>" +
                        "<span class=\"arrow\"></span>" +
                        "</a>" +
                        "</li>" +
                        "<li><a href=\"javascript:void(0);\" onclick='like(" + result.data[i].newsId + "," + result.data[i].newsLike +
                        ")'><span>喜欢</span><span id='newsId" + result.data[i].newsId + "Like'>" + result.data[i].newsLike +
                        "</span></a></li>" +
                        "</ul>" +
                        "</div>");
                    itemMain.append(uInfo);
                    itemMain.append(itemContent);
                    itemMain.append(uList);

                    var itemRepeat = $("<div class='item-repeat'  id=\"commentID" + result.data[i].newsId + "\" style=\"display: none\"></div>");
                    var selfRepeat = $("<div class=\"self-repeat\">" +
                        "<div class=\"repeat-inputtxt\" id=\"cnt" + result.data[i].newsId + "\" contenteditable=\"true\"></div>" +
                        //"<input type='text' name=\"commentText\" id=\"textt" + result.data[i].newsId + "\">" +
                        //"<input type='text' name=\"newsId\" value=\"" + result.data[i].newsId + "\">" +
                        "<button type=\"button\" class=\"repeat-inputtxt-btn\" onclick=\"doComment(" + result.data[i].newsId + ")\">" +
                        "评 论" +
                        "</button>" +
                        "</div>");
                    var repeatList = $("<div id='repeatID" + result.data[i].newsId + "' class=\"repeat-list\"></div>");
                    if (result.data[i].comments != null) {
                        for (var j = 0; j < result.data[i].comments.length; j++) {
                            var repeatIcon = "<div class=\"repeat-icon\">" +
                                "<a href=\"javascript:void(0)\"><img src=\"./images/user3.png\" alt=\"葵花妹\" width=\"30px\"></a>" +
                                "</div>";
                            var repeatContent = $("<div class=\"repeat-content\"></div>");
                            var repeatContentText = $("<div class=\"repeat-content-text\">" +
                                "<a href=\"javascript:void(0);\">" + result.data[i].comments[j].user.userName + "</a> : " +
                                result.data[i].comments[j].commentText +
                                "</div>");
                            var repeatContentFunc = $("<div class=\"repeat-content-func\">" +
                                "<div class=\"repeat-time\">" + result.data[i].comments[j].commentTime + "</div>" +
                                "</div>");
                            repeatContent.append(repeatIcon);
                            repeatContent.append(repeatContentText);
                            repeatContent.append(repeatContentFunc);
                            repeatContent.append("<br />");
                            repeatList.append(repeatContent);
                        }
                    }
                    itemRepeat.append(selfRepeat);
                    itemRepeat.append(repeatList);

                    item.append(itemMain);
                    item.append(itemRepeat);
                    $(".content").append(item);
                }
            }
        });
    });
    var getAndShowNews = function (result, content) {
        for (var i = 0; i < result.data.length; i++) {
            var item = $("<div class='item'></div>");
            var itemMain = $("<div class='item-main'></div>");
            var uInfo = $(
                "<div class=\"u-info\"><div class=\"u-icon\">" +
                "<img src=\"/photo/" + result.data[i].user.photo + "\" alt=\"IVEN-木罐\" style=\"height:60px;width: 60px;\"/>" +
                "</div>" +
                "<div class=\"name-pub\">" +
                "<div class=\"u-name\">" + "<a href=\"\">" + result.data[i].user.userName + "</a>" + "</div>" +
                "<div class=\"u-pub\">" + result.data[i].newsTime + "</div>" +
                "</div>" +
                "</div>"
            );
            var itemContent = $("<div class=\"itemcontent\"></div>");
            if (result.data[i].newsPhoto != null) {
                itemContent.append("<div class=\"thumbnail\">" +
                    "<img src=\"/photo/" + result.data[i].newsPhoto + "\" alt=\"img1\" style=\"width:100px;height: 100px;\"/>" +
                    "</div>");
            }
            itemContent.append("<div class=\"full-text\">" +
                "<p>" + result.data[i].newsText + "</p></div>");
            var uList = $("<div class=\"u-list\">" +
                "<ul>" +
                "<li>" +
                "<a onclick=\"comment('" + result.data[i].newsId + "')\" class=\"arrow-warp\">" +
                "<span>评论</span><span id='commentId" + result.data[i].newsId + "Number'>" + result.data[i].comments.length +"</span>" +
                "<span class=\"arrow\"></span>" +
                "</a>" +
                "</li>" +
                "<li><a href=\"javascript:void(0);\" onclick='like(" + result.data[i].newsId + "," + result.data[i].newsLike +
                ")'><span>喜欢</span><span id='newsId" + result.data[i].newsId + "Like'>" + result.data[i].newsLike +
                "</span></a></li>" +
                "</ul>" +
                "</div>");
            itemMain.append(uInfo);
            itemMain.append(itemContent);
            itemMain.append(uList);

            var itemRepeat = $("<div class='item-repeat'  id=\"commentID" + result.data[i].newsId + "\" style=\"display: none\"></div>");
            var selfRepeat = $("<div class=\"self-repeat\">" +
                "<div class=\"repeat-inputtxt\" id=\"cnt" + result.data[i].newsId + "\" contenteditable=\"true\"></div>" +
                //"<input type='text' name=\"commentText\" id=\"textt" + result.data[i].newsId + "\">" +
                //"<input type='text' name=\"newsId\" value=\"" + result.data[i].newsId + "\">" +
                "<button type=\"button\" class=\"repeat-inputtxt-btn\" onclick=\"doComment(" + result.data[i].newsId + ")\">" +
                "评 论" +
                "</button>" +
                "</div>");
            var repeatList = $("<div id='repeatID" + result.data[i].newsId + "' class=\"repeat-list\"></div>");
            if (result.data[i].comments != null) {
                for (var j = 0; j < result.data[i].comments.length; j++) {
                    var repeatIcon = "<div class=\"repeat-icon\">" +
                        "<a href=\"javascript:void(0)\"><img src=\"./images/user3.png\" alt=\"葵花妹\" width=\"30px\"></a>" +
                        "</div>";
                    var repeatContent = $("<div class=\"repeat-content\"></div>");
                    var repeatContentText = $("<div class=\"repeat-content-text\">" +
                        "<a href=\"javascript:void(0);\">" + result.data[i].comments[j].user.userName + "</a> : " +
                        result.data[i].comments[j].commentText +
                        "</div>");
                    var repeatContentFunc = $("<div class=\"repeat-content-func\">" +
                        "<div class=\"repeat-time\">" + result.data[i].comments[j].commentTime + "</div>" +
                        "</div>");
                    repeatContent.append(repeatIcon);
                    repeatContent.append(repeatContentText);
                    repeatContent.append(repeatContentFunc);
                    repeatContent.append("<br />");
                    repeatList.append(repeatContent);
                }
            }
            itemRepeat.append(selfRepeat);
            itemRepeat.append(repeatList);

            item.append(itemMain);
            item.append(itemRepeat);
            content.append(item);
        }
    };
    //发布
    var onPublish = function () {
        var userId = ${sessionScope.user.userId};
        var publishNewsText = $("#publishNewsText").val();
        $.post("/news/createWithoutPhoto", {userId: userId, newsText: publishNewsText}, function (result) {
            if (result.status) {
                console.log("suc");
                window.location.reload();
            }
            else {
                console.log(result.msg);
            }
        });
    }
    //喜欢
    function like(newsId, newsLike) {
        $.post("/news/like/" + newsId, {newsId: newsId}, function (result) {
            if (result.status) {
                $("#newsId" + newsId + "Like").html(newsLike + 1);
            }
        });
    }
    //打开/关闭评论
    function comment(newsId) {
        var commentDiv = $("#commentID" + newsId);
        if (commentDiv.css("display") === "block") {
            commentDiv.css("display", "none");
        }
        else if (commentDiv.css("display") === "none") {
            commentDiv.css("display", "block");
        }
    }
    //执行评论
    function doComment(newsId) {
        var userId = ${sessionScope.user.userId};
        var text = $("#cnt" + newsId).html();
       $.post("/comment/create", {commentText: text, newsId: newsId, userId: userId}, function (result) {
            if (result.status) {
                console.log("suc");
                var repeatList = $("#repeatID" + newsId );
                var repeatIcon = "<div class=\"repeat-icon\">" +
                    "<a href=\"javascript:void(0)\"><img src=\"./images/user3.png\" alt=\"葵花妹\" width=\"30px\"></a>" +
                    "</div>";
                var repeatContent = $("<div class=\"repeat-content\"></div>");
                var repeatContentText = $("<div class=\"repeat-content-text\">" +
                    "<a href=\"javascript:void(0);\">" + result.data.user.userName + "</a> : " +
                    result.data.commentText +
                    "</div>");
                var repeatContentFunc = $("<div class=\"repeat-content-func\">" +
                    "<div class=\"repeat-time\">" + result.data.commentTime + "</div>" +
                    "</div>");
                repeatContent.append(repeatIcon);
                repeatContent.append(repeatContentText);
                repeatContent.append(repeatContentFunc);
                repeatContent.append("<br />");
                repeatList.append(repeatContent);
                $("#commentId" + newsId + "Number").html(Number($("#commentId" + newsId + "Number").html()) + 1);
            }
            else {
                console.log(result.msg);
            }
        });
    }
</script>
</body>
</html>
