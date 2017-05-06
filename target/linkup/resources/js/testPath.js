/**
 * Created by Victor_Zhou on 2017-5-6.
 */
function testPath(matrix, x, y, x1, y1, x2, y2){

    var pathResult = {};
    var pointCoordinateList = [];
    pathResult.isConnected = false;

    if((x1 == x2 && Math.abs(y1 - y2) == 1) || (y1 == y2 && Math.abs(x1 - x2) == 1)){
        pointCoordinateList.push([x1, y1]);
        pointCoordinateList.push([x2, y2]);
        pathResult.pointCoordinateList = pointCoordinateList;
        pathResult.isConnected = true;
    }

    if(!pathResult.isConnected){
        for(var i = parseInt((y1 + y2) / 2); i >= 0; i--){
            var isIntercommunication = true;
            for(var j = (x1 < x2 ? x1 : x2) + 1; j < (x1 > x2 ? x1 : x2); j++){
                if(matrix[j][i] != 0){
                    isIntercommunication = false;
                    break;
                }
            }

            if(!isIntercommunication) continue;

            if(y1 < i){
                for(var j = i; j < y1; j--){
                    if(matrix[x1][j] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(y1 > i){
                for(var j = i; j < y1; j++){
                    if(matrix[x1][j] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }


            if(!isIntercommunication) break;

            if(y2 < i){
                for(var j = i; j > y2; j--){
                    if(matrix[x2][j] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(y2 > i){
                for(var j = i; j < y2; j++){
                    if(matrix[x2][j] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(!isIntercommunication) break;

            for(var j = (y1 < i ? y1 : i); j <= (y1 > i ? y1 : i); j++){
                pointCoordinateList.push([x1, j]);
            }
            for(var j = (y2 < i ? y2 : i); j <= (y2 > i ? y2 : i); j++){
                pointCoordinateList.push([x2, j]);
            }
            for(var j = (x1 < x2 ? x1 : x2) + 1; j < (x1 > x2 ? x1 : x2); j++){
                pointCoordinateList.push([j, i]);
            }

            pathResult.pointCoordinateList = pointCoordinateList;
            pathResult.isConnected = true;
            break;
        }
    }

    if(!pathResult.isConnected){
        for(var i = parseInt((y1 + y2) / 2) + 1; i < y; i++){
            var isIntercommunication = true;
            for(var j = (x1 < x2 ? x1 : x2) + 1; j < (x1 > x2 ? x1 : x2); j++){
                if(matrix[j][i] != 0){
                    isIntercommunication = false;
                    break;
                }
            }

            if(!isIntercommunication) continue;

            if(y1 < i){
                for(var j = i; j > y1; j--){
                    if(matrix[x1][j] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(y1 > i){
                for(var j = i; j < y1; j++){
                    if(matrix[x1][j] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }


            if(!isIntercommunication) break;

            if(y2 < i){
                for(var j = i; j > y2; j--){
                    if(matrix[x2][j] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(y2 > i){
                for(var j = i; j < y2; j++){
                    if(matrix[x2][j] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(!isIntercommunication) break;

            for(var j = (y1 < i ? y1 : i); j <= (y1 > i ? y1 : i); j++){
                pointCoordinateList.push([x1, j]);
            }
            for(var j = (y2 < i ? y2 : i); j <= (y2 > i ? y2 : i); j++){
                pointCoordinateList.push([x2, j]);
            }
            for(var j = (x1 < x2 ? x1 : x2) + 1; j < (x1 > x2 ? x1 : x2); j++){
                pointCoordinateList.push([j, i]);
            }

            pathResult.pointCoordinateList = pointCoordinateList;
            pathResult.isConnected = true;
            break;
        }
    }

    if(!pathResult.isConnected){
        for(var i = parseInt((x1 + x2) / 2); i >= 0; i--){
            var isIntercommunication = true;
            for(var j = (y1 < y2 ? y1 : y2) + 1; j < (y1 > y2 ? y1 : y2); j++){
                if(matrix[i][j] != 0){
                    isIntercommunication = false;
                    break;
                }
            }

            if(!isIntercommunication) continue;

            if(x1 < i){
                for(var j = i; j > x1; j--){
                    if(matrix[j][y1] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(x1 > i){
                for(var j = i; j < x1; j++){
                    if(matrix[j][y1] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }


            if(!isIntercommunication) break;

            if(x2 < i){
                for(var j = i; j > x2; j--){
                    if(matrix[j][y2] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(x2 > i){
                for(var j = i; j < x2; j++){
                    if(matrix[j][y2] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(!isIntercommunication) break;

            for(var j = (x1 < i ? x1 : i); j <= (x1 > i ? x1 : i); j++){
                pointCoordinateList.push([j, y1]);
            }
            for(var j = (x2 < i ? x2 : i); j <= (x2 > i ? x2 : i); j++){
                pointCoordinateList.push([j, y2]);
            }
            for(var j = (y1 < y2 ? y1 : y2) + 1; j < (y1 > y2 ? y1 : y2); j++){
                pointCoordinateList.push([i, j]);
            }

            pathResult.pointCoordinateList = pointCoordinateList;
            pathResult.isConnected = true;
            break;
        }
    }

    if(!pathResult.isConnected){
        for(var i = parseInt((x1 + x2) / 2) + 1; i < x; i++){
            var isIntercommunication = true;
            for(var j = (y1 < y2 ? y1 : y2) + 1; j < (y1 > y2 ? y1 : y2); j++){
                if(matrix[i][j] != 0){
                    isIntercommunication = false;
                    break;
                }
            }

            if(!isIntercommunication) continue;

            if(x1 < i){
                for(var j = i; j > x1; j--){
                    if(matrix[j][y1] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(x1 > i){
                for(var j = i; j < x1; j++){
                    if(matrix[j][y1] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }


            if(!isIntercommunication) break;

            if(x2 < i){
                for(var j = i; j > x2; j--){
                    if(matrix[j][y2] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(x2 > i){
                for(var j = i; j < x2; j++){
                    if(matrix[j][y2] != 0){
                        isIntercommunication = false;
                        break;
                    }
                }
            }

            if(!isIntercommunication) break;

            for(var j = (x1 < i ? x1 : i); j <= (x1 > i ? x1 : i); j++){
                pointCoordinateList.push([j, y1]);
            }
            for(var j = (x2 < i ? x2 : i); j <= (x2 > i ? x2 : i); j++){
                pointCoordinateList.push([j, y2]);
            }
            for(var j = (y1 < y2 ? y1 : y2) + 1; j < (y1 > y2 ? y1 : y2); j++){
                pointCoordinateList.push([i, j]);
            }


            pathResult.pointCoordinateList = pointCoordinateList;
            pathResult.isConnected = true;
            break;
        }
    }

    return pathResult;
}