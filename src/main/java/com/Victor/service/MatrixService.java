package com.Victor.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by Victor_Zhou on 2017-5-5.
 */
public class MatrixService {

    public void initMatrix(int[][] matrix, int x, int y, int typeNum){
        List<String> coordinateList = new ArrayList<>();
        int size = (x - 2) * (y - 2);
        int initLength = size / 2;

        for(int i = 1; i < x - 1; i++)
            for(int j = 1; j < y - 1; j ++)
                coordinateList.add(i + "," + j);

        int index;
        Random random = new Random();
        String[] coordinate;
        for(int i = initLength; i > 0; i--){
            int initNum = (i % typeNum) + 1;

            index = random.nextInt(size);
            coordinate = coordinateList.get(index).split(",");
            matrix[Integer.parseInt(coordinate[0])][Integer.parseInt(coordinate[1])] = initNum;
            coordinateList.remove(index);
            size--;

            index = random.nextInt(size);
            coordinate = coordinateList.get(index).split(",");
            matrix[Integer.parseInt(coordinate[0])][Integer.parseInt(coordinate[1])] = initNum;
            coordinateList.remove(index);
            size--;

        }
    }



}
