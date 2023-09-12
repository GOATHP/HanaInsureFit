package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.controller;

import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.service.RestaurantService;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    @PostMapping("/recommendFoodGuDong")
    public ResponseEntity<List<Restaurant>> recommendFoodGuDong(@RequestBody String guDong, HttpServletRequest request) {

        guDong = guDong.replaceAll("[^ㄱ-ㅎ가-힣\\s]", "");

        List<Restaurant> restaurantList = restaurantService.getRestaurant(guDong);
        for (Restaurant restaurant : restaurantList) {
            System.out.println("이름: " + restaurant.getName());
        }

//        HttpSession session = request.getSession();

        return ResponseEntity.ok(restaurantList);
    }
}
