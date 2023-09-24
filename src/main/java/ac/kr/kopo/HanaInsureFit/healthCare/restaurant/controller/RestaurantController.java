package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.controller;

import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.MenuCalories;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.service.RestaurantService;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.RestaurantResponse;
import jdk.swing.interop.SwingInterOpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static ac.kr.kopo.HanaInsureFit.util.MenuDictionary.createMenuDictionary;
import static ac.kr.kopo.HanaInsureFit.util.MenuDictionary.generateSubstrings;

@Controller
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    @PostMapping("/recommendFoodGuDong")
    public ResponseEntity<List<Restaurant>> recommendFoodGuDong(@RequestBody String guDong, HttpServletRequest request) {

        guDong = guDong.replaceAll("[^ㄱ-ㅎ가-힣\\s]", "");

        List<Restaurant> restaurantList = restaurantService.getRestaurant(guDong);

            System.out.println("이거 다 먹어야지 ~!~!~!~! : ");

//        HttpSession session = request.getSession();

        return ResponseEntity.ok(restaurantList);
    }
    @PostMapping("/getRestaurant")
    public ResponseEntity<RestaurantResponse> getSelectedRestaurant(@RequestBody String restaurantName) throws UnsupportedEncodingException {
        restaurantName = URLDecoder.decode(restaurantName, "UTF-8");
        List<String> inputList = new ArrayList<>();
        Restaurant restaurant = restaurantService.getSelectedRestaurant(restaurantName);

        String classification2 = restaurant.getClassification2();
        Integer calories = restaurantService.getRestaurantCalories(classification2);


        RestaurantResponse response = new RestaurantResponse(restaurant, calories);

//        List<List<MenuCalories>> menuCaloriesList = new ArrayList<>();
//        List<MenuCalories> calories = new ArrayList<>();
//        calories = restaurantService.getMenuCalories("삼겹");
//        System.out.println(calories);
//        for (Map.Entry<String, Integer> entry : menuDict.entrySet()) {
//            System.out.println("메뉴: " + entry.getKey() + ", 칼로리: " + entry.getValue());
//            inputList = generateSubstrings(entry.getKey());
//            System.out.println(inputList);
//            for (String i : inputList) {
//                System.out.println("인풋값 => " + i);
//                try {
//                    calories = restaurantService.getMenuCalories(i);
//                    if (calories != null) {
//                        System.out.println(calories);
//                    } else {
//                        System.out.println(i + "의 칼로리 정보가 없습니다.");
//                    }
//                } catch (Exception e) {
//                    // 예외 발생 시 무시하고 다음 항목을 처리
//                    System.err.println("예외 발생: " + e.getMessage());
//                }
//            }
//            menuCaloriesList.add(calories);
//            for (List<MenuCalories> i : menuCaloriesList) {
//                for (MenuCalories ii : i) {
//                    System.out.println(ii); // Print MenuCalories objects
//                }
//            }
//        }
        return ResponseEntity.ok(response);
        }
    }

