<%--
  Created by IntelliJ IDEA.
  User: Victor_Zhou
  Date: 2017-5-5
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/metro.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/metro-icons.min.css">

    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/metro.min.js"></script>

    <script>

        function begin (level) {
            window.location.href = "/begin?difficulty=" + level;
        }

    </script>

</head>
<body>

<div class="container">

    <div class="grid">
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>

        <div class="cell" align="center">
            <h2>
                <span class="mif-gamepad">欢迎来到连连看</span>
            </h2>
        </div>

        <br>

        <div class="cell" align="right">
            <h4>
                游戏共进行：${playInfo.playCounter}人/次
            </h4>
            <h4>
                游戏中共有：${playInfo.winCounter}人/次成功
            </h4>
            <h4>
                游戏中共有：${playInfo.loseCounter}人/次失败
            </h4>
        </div>

        <br>
        <br>
        <br>
        <br>

        <div class="cell" align="center">
            <h4>点击按钮开始</h4>
        </div>

        <br>

        <div class="row cells5" align="center">
            <div class="cell">
            </div>

            <div class="cell">
                <button class="button loading-pulse bg-lightGreen" onclick="begin('0')">简单模式</button>
            </div>
            <div class="cell">
                <button class="button loading-pulse bg-orange" onclick="begin('1')">一般模式</button>
            </div>
            <div class="cell">
                <button class="button loading-pulse bg-red" onclick="begin('2')">困难模式</button>
            </div>

            <div class="cell">
            </div>
        </div>

    </div>

</div>

</body>
</html>
