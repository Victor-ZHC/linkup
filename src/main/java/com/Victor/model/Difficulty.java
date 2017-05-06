package com.Victor.model;

import org.springframework.web.servlet.DispatcherServlet;

/**
 * Created by Victor_Zhou on 2017-5-5.
 */
public class Difficulty {

    String[] difficultyList = {"简单模式", "一般模式", "困难模式"};
    String difficultyString;

    public Difficulty(int difficulty){
        this.setDifficultyString(difficultyList[difficulty]);
    }

    public String getDifficultyString() {
        return difficultyString;
    }

    public void setDifficultyString(String difficultyString) {
        this.difficultyString = difficultyString;
    }
}
