package com.Victor.service;

import com.Victor.model.Matrix;


/**
 * Created by Victor_Zhou on 2017-5-5.
 */
public class GameService {

    private MatrixService matrixService;

    int[][] difficultyIndex = {
            {10, 8, 5},
            {16, 14, 6},
            {22, 20, 7}
    };

    public GameService(){
        this.matrixService = new MatrixService();
    }

    public Matrix startGame(int difficulty){
        Matrix matrix = new Matrix(difficultyIndex[difficulty][0], difficultyIndex[difficulty][1]);
        matrixService.initMatrix(matrix.getMatrix(), matrix.getX(), matrix.getY(), difficultyIndex[difficulty][2]);
        return matrix;
    }

}
