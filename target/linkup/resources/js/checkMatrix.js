/**
 * Created by Victor_Zhou on 2017-5-6.
 */
function isCleared(matrix, x, y){
    var isCleared = true;
    for(var i = 0; i < x; i++){
        for(var j = 0; j < y; j++){
            if(matrix[i][j] != 0){
                isCleared = false;
                break;
            }
        }
        if(!isCleared)
            break;
    }
    return isCleared;
}