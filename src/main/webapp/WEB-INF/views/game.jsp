<%--
  Created by IntelliJ IDEA.
  User: Victor_Zhou
  Date: 2017-5-5
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/metro.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/metro-icons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/metro-colors.min.css">

    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/metro.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/testPath.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/checkMatrix.js"></script>

    <script>

        var matrix;
        var selectedList = [];

        var valueToColor = {
            "0": "bg-white",
            "1": "bg-red",
            "2": "bg-orange",
            "3": "bg-yellow",
            "4": "bg-green",
            "5": "bg-blue",
            "6": "bg-indigo",
            "7": "bg-violet"
        };

        var afterClickColor = {
            "1": "ribbed-red",
            "2": "ribbed-orange",
            "3": "ribbed-yellow",
            "4": "ribbed-green",
            "5": "ribbed-blue",
            "6": "ribbed-indigo",
            "7": "ribbed-violet"
        };

        var pathColor = {
            "0": "bg-grayLight",
            "1": "bg-darkRed",
            "2": "bg-darkOrange",
            "3": "bg-amber",
            "4": "bg-darkGreen",
            "5": "bg-darkBlue",
            "6": "bg-darkIndigo",
            "7": "bg-darkViolet"
        };

        $(document).ready(function () {

            var matrixString = document.getElementById("matrixString").innerHTML;
            //alert(matrixString);

            matrix = JSON.parse(matrixString);
            //console.log(matrix);

            var ratio = 0.5;

            for(var i = 0; i < Number(matrix["x"]); i++){
                document.getElementById("myFrame").innerHTML += '<div class="row cell-auto-size" id="row' + i + '"></div>';
                for (var j = 0; j < Number(matrix["y"]); j++){
                    document.getElementById("row" + i).innerHTML += '<div class="cell" id="'+ i + '_' + j + '" onClick="divClick('+ i + ',' + j + ')"></div>'
                }
            }

            var myFrameWidth = $("#myFrame").width();
            var cellHeight = myFrameWidth * ratio / Number(matrix["y"]);

            for(var i = 0; i < Number(matrix["x"]); i++) {
                for (var j = 0; j < Number(matrix["y"]); j++) {
                    $("#" + i + "_" + j).height(cellHeight);
                    $("#" + i + "_" + j).addClass(valueToColor[matrix["matrix"][i][j]]);
                }
            }

            $("#countdown").countdown({
                minutes: 3,
                seconds: 0,
                labelColor: 'fg-gray',
                backgroundColor: 'bg-green',
                onStop: function () {
                    alert("时间到！");
                    window.location.href = "/lose";
                }
            });

        });

        function divClick(x, y) {
            x = Number(x);
            y = Number(y);

            if(selectedList.length > 0){
                var selected = selectedList.pop();
                var select = {};
                select.X = x;
                select.Y = y;
                select.VALUE = matrix["matrix"][x][y];

                if(afterClickColor[select.VALUE] == undefined){
                    selectedList.push(selected);
                    return;
                }else if(select.X == selected.X && select.Y == selected.Y){
                    $("#" + selected.X + "_" + selected.Y).removeClass(afterClickColor[matrix["matrix"][selected.X][selected.Y]]);
                    $("#" + selected.X + "_" + selected.Y).addClass(valueToColor[matrix["matrix"][selected.X][selected.Y]]);
                }else if(selected.VALUE != select.VALUE){
                    $("#" + selected.X + "_" + selected.Y).removeClass(afterClickColor[matrix["matrix"][selected.X][selected.Y]]);
                    $("#" + selected.X + "_" + selected.Y).addClass(valueToColor[matrix["matrix"][selected.X][selected.Y]]);
                } else {
                    var pathResult = testPath(matrix["matrix"], matrix["x"], matrix["y"], selected.X, selected.Y, select.X, select.Y);

                    if(pathResult.isConnected){

                        $("#" + x + "_" + y).removeClass(valueToColor[matrix["matrix"][x][y]]);
                        $("#" + selected.X + "_" + selected.Y).removeClass(afterClickColor[matrix["matrix"][selected.X][selected.Y]]);
                        for (var i = 0; i < pathResult.pointCoordinateList.length; i++){
                            var location = pathResult.pointCoordinateList[i];
                            $("#" + location[0] + "_" + location[1]).removeClass(valueToColor[matrix["matrix"][location[0]][location[1]]]);
                            $("#" + location[0] + "_" + location[1]).addClass(pathColor[matrix["matrix"][location[0]][location[1]]]);
                        }

                        setTimeout(function(){
                            for (var i = 0; i < pathResult.pointCoordinateList.length; i++){
                                var location = pathResult.pointCoordinateList[i];
                                $("#" + location[0] + "_" + location[1]).removeClass(pathColor[matrix["matrix"][location[0]][location[1]]]);
                                $("#" + location[0] + "_" + location[1]).addClass(valueToColor[matrix["matrix"][location[0]][location[1]]]);
                            }

                            $("#" + x + "_" + y).removeClass(valueToColor[matrix["matrix"][x][y]]);
                            $("#" + selected.X + "_" + selected.Y).removeClass(valueToColor[matrix["matrix"][selected.X][selected.Y]]);
                            matrix["matrix"][x][y] = 0;
                            matrix["matrix"][selected.X][selected.Y] = 0;
                            $("#" + x + "_" + y).addClass(valueToColor[matrix["matrix"][x][y]]);
                            $("#" + selected.X + "_" + selected.Y).addClass(valueToColor[matrix["matrix"][selected.X][selected.Y]]);

                            if(isCleared(matrix["matrix"], matrix["x"], matrix["y"])){
                                alert("你真棒！");
                                window.location.href = "/win";
                            }
                        },500);



                    } else {

                        $("#" + selected.X + "_" + selected.Y).removeClass(afterClickColor[matrix["matrix"][selected.X][selected.Y]]);
                        $("#" + selected.X + "_" + selected.Y).addClass(valueToColor[matrix["matrix"][selected.X][selected.Y]]);

                    }

                }

            } else {
                var select = {};
                select.X = x;
                select.Y = y;
                select.VALUE = matrix["matrix"][x][y];

                if(afterClickColor[select.VALUE] == undefined){
                    return;
                } else {
                    $("#" + x + "_" + y).removeClass(valueToColor[matrix["matrix"][x][y]]);
                    $("#" + x + "_" + y).addClass(afterClickColor[matrix["matrix"][x][y]]);
                    selectedList.push(select);
                }
            }



        }

        function quit () {
            if(window.confirm("是否退出游戏？")){
                window.location.href = "/quit";
            } else {
                return;
            }
        }

    </script>

</head>
<div class="container">

    <div class="flex-grid" align="center">

        <div class="cell">
            <h2>
                这里是${difficulty.difficultyString}的连连看
            </h2>
        </div>

        <div class="cell">
            <div class="countdown" id="countdown"></div>
        </div>

    </div>


    <div class="flex-grid" id="myFrame">

    </div>

    <div class="flex-grid" align="center">
        <div class="cell" align="center">
            <button class="image-button danger" onclick="quit()">
                退出游戏
                <span class="icon mif-exit"></span>
            </button>
        </div>

    </div>

</div>

<div id="matrixString" hidden>${matrix}</div>

<div id="result"></div>

</body>
</html>
