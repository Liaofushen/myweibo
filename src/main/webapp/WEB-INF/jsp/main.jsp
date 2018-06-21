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
    <script src="http://code.jquery.com/jquery-latest.js"></script>
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
                <li>
                    <form action="/search" method="post">
                        <input type="text" name="search"/>
                        <input type="submit" value="搜索" style="height: 25px"/>
                    </form>
                </li>
                <li>
                    <a href="#">私信</a>
                    <div class="num">6</div>
                </li>
                <li>
                    <a href="/user/getNotice">通知</a>
                    <div class="num">14</div>
                </li>
                <li class="account">
                    <a href="/user/index">${sessionScope.user.userName}</a>
                    <div class="account-panel">
                        <ul>
                            <li class="panel1"><a href="/user/setting">设置</a></li>
                            <li class="panel2"><a href="/user/logout">退出</a></li>
                            <li class="panel2"><a href="/user/changePassPage">更改密码</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="main">
    <div class="content">

    </div>
</div>
<div class="p-info">
    <div class="p-icon">
        <img src="/photo/${sessionScope.user.userPhoto}" alt="picon" style="width: 100px;height: 100px">
    </div>
    <div class="p-name"><a href="/homepage/myOwn?username=${sessionScope.user.userName}">${sessionScope.user.userName}</a></div>
    <div class="p-intro">999</div>
    <div class="p-profile">
        <ul>
            <li><a href="/relation/getFollowers?userName=${sessionScope.user.userName}">
                <span>关注</span>
                <span class="p-following">999</span>
            </a></li>
            <li><a href="/relation/getFans?userName=${sessionScope.user.userName}">
                <span>粉丝</span>
                <span class="p-followed">999</span>
            </a></li>
            <li><a href="/homepage/myOwn?username=${sessionScope.user.userName}">
                <span>说说</span>
                <span class="p-publish">999</span>
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
        <!--<form action="/news/publish" enctype="multipart/form-data" method="post">
            <textarea id="publishNewsText" name="newstext"></textarea>
            <input id="publishPhoto" type="file" class="file" name="photo" accept="image/jpeg"/>
            <input type="submit" class="post-btn" name="button"/>
        </form>-->
        <div>
            <textarea id="publishNewsText" name="newstext"></textarea>
            <input id="publishPhoto" type="file" class="file" name="photo" accept="image/jpeg"/>
            <button onclick="publish()" class="post-btn">提 交</button>
        </div>
    </div>
</div>

<script type="text/javascript" src="/static/js/publish.js"></script>
<script type="text/javascript" src="/static/js/index.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
    $(document).ready(function () {
        $.get("/news/all", function (result) {
            if (result.status) {
                for (var i = 0; i < result.data.length; i++) {
                    console.log(i);
                    var item = $("<div class='item'></div>");
                    var itemMain = $("<div class='item-main'></div>");
                    var uInfo = $(
                        "<div class=\"u-info\"><div class=\"u-icon\">" +
                        "<img src=\"/photo/" + result.data[i].user.photo + "\" alt=\"IVEN-木罐\" style=\"height:60px;width: 60px;\"/>" +
                        "</div>" +
                        "<div class=\"name-pub\">" +
                        "<div class=\"u-name\">" + "<a href=\"\">" + result.data[i].user.userName + "</a>" + "</div>" +
                        "<div class=\"u-pub\">" + result.data[i].user.userTime + "</div>" +
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
                        "<span>评论</span>" +
                        "<span>newsComment</span>" +
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
                        "<input type=hidden name=\"commentText\" id=\"textt" + result.data[i].newsId + "\">" +
                        "<input type=hidden name=\"newsId\" value=\"" + result.data[i].newsId + "\">" +
                        "<button type=\"button\" class=\"repeat-inputtxt-btn\" onclick=\"doComment(" + result.data[i].newsId + ")\">" +
                        "评 论" +
                        "</button>" +
                        "</div>");
                    var repeatList = $("<div class=\"repeat-list\">" +
                        "<div class=\"repeat-icon\">" +
                        "<a href=\"javascript:void(0)\"><img src=\"./images/user3.png\" alt=\"葵花妹\" width=\"30px\"></a>" +
                        "</div></div>");
                    if (result.data[i].comments != null) {
                        for (var j = 0; j < result.data[i].comments.length; j++) {
                            var repeatContent = $("<div class=\"repeat-content\"></div>");
                            var repeatContentText = $("<div class=\"repeat-content-text\">" +
                                "<a href=\"javascript:void(0);\">" + result.data[i].comments[j].user.userName + "</a>" +
                                result.data[i].comments[j].commentText +
                                "</div>");
                            var repeatContentFunc = $("<div class=\"repeat-content-func\">" +
                                "<div class=\"repeat-time\">" + result.data[i].comments[j].commentTime + "</div>" +
                                "</div>");
                            repeatContent.append(repeatContentText);
                            repeatContent.append(repeatContentFunc);
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
</script>
<script>
    //发布
    function publish() {
        var userId = ${sessionScope.user.userId};
        var publishNewsText = $("#publishNewsText").val();
        $.post("/news/createWithoutPhoto", {userId: userId, newsText: publishNewsText}, function (result) {
            if (result.status) {
                console.log("suc");
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
        var text = $("#textt" + newsId).val();
        $.post("/comment/create", {commentText: text, newsId: newsId, userId: userId}, function (result) {
            if (result.status) {
                console.log("suc");
            }
            else {
                console.log(result.msg);
            }
        });
    }
</script>
</body>
</html>
