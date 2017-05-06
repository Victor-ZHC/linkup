package com.Victor.model;

/**
 * Created by Victor_Zhou on 2017-5-5.
 */
public class Matrix {

    private int[][] matrix;
    private int x;
    private int y;

    public Matrix(int x, int y) {

        this.matrix = new int[x][y];
        this.x = x;
        this.y = y;

    }

    public int[][] getMatrix() {
        return matrix;
    }

    public void setMatrix(int[][] matrix) {
        this.matrix = matrix;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

}
