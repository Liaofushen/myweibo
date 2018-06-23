<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache">

    <title>${viewUser.userName}的微博</title>
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
            <c:choose>
                <c:when test="${empty sessionScope.get('user')}">
                    <a href="/signin">登陆</a>
                </c:when>
            </c:choose>
        </div>
        <div class="nav">
            <ul>
                <c:choose>
                    <c:when test="${empty sessionScope.get('user')}">
                            </c:when>
                    <c:otherwise>
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
                                    <li class="panel1" onclick="doLogout()"><a>退出</a></li>
                                </ul>
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</div>
<div class="main">
    <div class="main-nav">
        <div onclick="showDivAndHideOther(0)" class="nav-item"><a>说说</a></div>
        <div onclick="showDivAndHideOther(1)" class="nav-item"><a>粉丝</a></div>
        <div onclick="showDivAndHideOther(2)" class="nav-item"><a>关注</a></div>
    </div>
    <div style="display: none;width: 624px;height: 1000px;" id="publishDIV"></div>
    <div style="display: none;" id="followedDIV"></div>
    <div style="display: none;" id="followingDIV"></div>
</div>
<div class="p-info">
    <div class="p-icon">
        <img src="/photo/${viewUser.userPhoto}" alt="picon" style="width: 100px;height: 100px">
    </div>
    <div class="p-name"><a>${viewUser.userName}</a></div>
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
            <li><a onclick="showDivAndHideOther(0)">
                <span>说说</span>
                <span id="numberOfPublish" class="p-publish">--</span>
            </a></li>
        </ul>
    </div>
</div>
</div>
<a id="gotop" href="#">回到顶部</a>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    var fanArray;
    var attentionArray;
    var newsArray;
    var divArray = [$("#publishDIV"), $("#followedDIV"), $("#followingDIV")];
    var showDivAndHideOther = function(index) {
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
    var doLogout = function () {
        $.get("/user/logout", function (result) {
            if (result.status) {
                window.location.href = "/signin";
            }
            else {
                alert(result.msg);
            }
        });
    };
    var doAttention = function (userFirst) {
        var userId = ${viewUser.userId};
        $.post("/user/fans", {userFirst: userFirst, userSecond: userId}, function (result) {
            if (result.status) {
                window.location.reload();
            }
            else {
                alert(result.msg);
            }
        });
    };
    $(document).ready(function () {
        $(".nav-item").eq(0).click();
        var userId = ${viewUser.userId};
        var account = $(".account");
        if (account.length > 0) {
            console.log("on login");
            var loginId = "${sessionScope.user.userId}";
            loginId = Number(loginId);
            if (userId === loginId) {
                window.location.href = "/main";
            }
            $.get("/user/attention/" + loginId, function (result) {
                if (result.status) {
                    var found = false;
                    for (var i = 0; i < result.data.length; i++) {
                        if (result.data[i].userId === userId) {
                            found = true;
                        }
                    }
                    if (found) {
                        $(".publish").html("<a>取关</a>");
                    }
                    else {
                        $(".publish").html("<a onclick='doAttention(" + loginId + ")'>关注</a>");
                    }
                }
            });
        }
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
    });
    var getAndShowNews = function (result, content, targetNumber) {
        for (var i = 0; i < result.data.length; i++) {
            var item = $("<div class='item'></div>");
            var itemMain = $("<div class='item-main'></div>");
            var uInfo = $(
                "<div class=\"u-info\"><div class=\"u-icon\">" +
                "<img src=\"/photo/" + result.data[i].user.photo + "\" alt=\"IVEN-木罐\" style=\"height:60px;width: 60px;\"/>" +
                "</div>" +
                "<div class=\"name-pub\">" +
                "<div class=\"u-name\">" + "<a href=\"/view/" + result.data[i].user.userId + "\">" + result.data[i].user.userName + "</a>" + "</div>" +
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
                        "<a href=\"/view/" + result.data[i].comments[j].user.userId + "\">" + result.data[i].comments[j].user.userName + "</a> : " +
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
        var userId = "${sessionScope.user.userId}";
        if (userId == "") {
            alert("请先登陆。")
            return;
        }
        userId = Number(userId);
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
