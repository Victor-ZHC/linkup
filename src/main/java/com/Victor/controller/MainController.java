package com.Victor.controller;

import com.Victor.model.Difficulty;
import com.Victor.model.PlayInfo;
import com.Victor.service.GameService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by Victor_Zhou on 2017-5-5.
 */

@Controller
public class MainController {


    PlayInfo playInfo = new PlayInfo();

    @RequestMapping(value = {"/", "/index"})
    public String index(Model model){
        model.addAttribute(playInfo);
        return "index";
    }

    @RequestMapping(value = "/begin")
    public String begin(@RequestParam(value = "difficulty")String difficulty, Model model){

        playInfo.setPlayCounter(playInfo.getPlayCounter() + 1);

        GameService gameService = new GameService();

        Gson gson = new Gson();
        String jsonMatrix = gson.toJson(gameService.startGame(Integer.parseInt(difficulty)));

        System.out.println(jsonMatrix);

        model.addAttribute("matrix", jsonMatrix);
        model.addAttribute("difficulty", new Difficulty(Integer.parseInt(difficulty)));

        return "game";
    }

    @RequestMapping(value = "/quit")
    public String quit(Model model){
        playInfo.setLoseCounter(playInfo.getLoseCounter() + 1);
        model.addAttribute(playInfo);
        return "index";
    }

    @RequestMapping(value = "/lose")
    public String lose(Model model){
        playInfo.setLoseCounter(playInfo.getLoseCounter() + 1);
        model.addAttribute(playInfo);
        return "index";
    }

    @RequestMapping(value = "/win")
    public String win(Model model){
        playInfo.setWinCounter(playInfo.getWinCounter() + 1);
        model.addAttribute(playInfo);
        return "index";
    }

}
