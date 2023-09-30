package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.controller;

import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.MenuCalories;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.service.RestaurantService;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant2;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.RestaurantResponse;
import jdk.swing.interop.SwingInterOpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.apache.commons.text.similarity.LevenshteinDistance;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

import static ac.kr.kopo.HanaInsureFit.util.MenuDictionary.createMenuDictionary;
import static ac.kr.kopo.HanaInsureFit.util.MenuDictionary.generateSubstrings;

@Controller
public class RestaurantController {

    @Autowired
    private RestaurantService restaurantService;

    @PostMapping("/recommendFoodGuDong")
    public ResponseEntity<List<Restaurant>> recommendFoodGuDong(@RequestBody String guDong, HttpServletRequest request) throws UnsupportedEncodingException {
        guDong = guDong.replaceAll("[^ㄱ-ㅎ가-힣\\s]", "");
        List<Restaurant> restaurantList = restaurantService.getRestaurant(guDong);
        List<RestaurantResponse> restaurantResponses = new ArrayList<>();
//        Map<String, Map<String, Integer>> menuKcalMap = new HashMap<>();
//        int count = 0;
//        for (Restaurant i : restaurantList) {
////            if (count >= 3) {
////                break; // 10개까지만 반복하고 나머지는 루프를 빠져나옴
////            }
//            RestaurantResponse restaurant = getSelectedRestaurant(i.getName()).getBody();
//            restaurantResponses.add(restaurant);
////        count++;
//        }
//        for (RestaurantResponse i : restaurantResponses){
//            Map<String, Integer> menuCaloriesMap = new HashMap<>();
//            String restaurantName = i.getRestaurant().getName();
//            MenuCalories menuCalories = i.getRestaurantInfo();
//            menuCaloriesMap.put("calories", menuCalories.getCalories());
//            menuCaloriesMap.put("fat", menuCalories.getFat());
//            menuCaloriesMap.put("carbs", menuCalories.getCarbs());
//            menuCaloriesMap.put("protein", menuCalories.getProtein());
//            System.out.println("@메뉴칼로리@ : " + menuCaloriesMap);
//            restaurantService.updateNutritionBatch(menuCaloriesMap, restaurantName);
//        }
        return ResponseEntity.ok(restaurantList);
    }
    @PostMapping("/getRestaurant")
    public ResponseEntity<RestaurantResponse> getSelectedRestaurant(@RequestBody String restaurantName) throws UnsupportedEncodingException {
        restaurantName = URLDecoder.decode(restaurantName, "UTF-8");
        System.out.println("식당명@@@@@@@@@@" + restaurantName);
        List<String> inputList = new ArrayList<>();
        Restaurant restaurant = restaurantService.getSelectedRestaurant(restaurantName);
//        String classification2 = restaurant.getClassification2();
//        Integer calories2 = restaurantService.getRestaurantCalories(classification2);

        Map<String, List<MenuCalories>> menuDict = new HashMap<>();
        System.out.println("식당메뉴@@@@@@@@@@" + restaurant.getDishes());
        String dishes = restaurant.getDishes(); // 메뉴를 포함한 문자열
        if (dishes == null) {
            // dishes가 null일 때 예외 처리
            dishes="";
        } else {
            // dishes가 null이 아닐 때 정상적인 처리
            // dishes 변수를 사용하여 메뉴 정보를 다루거나 출력할 수 있습니다.
            System.out.println("메뉴 정보: " + dishes);
        }
            String[] menuArray = dishes.split(", "); // 쉼표와 공백을 기준으로 문자열 분할

// 메뉴 정보 출력 또는 처리
            for (String menu : menuArray) {
                // 칼로리 값을 초기값인 0으로 설정

                // 메뉴를 menuDict에 추가
                menuDict.put(menu, new ArrayList<>());
                // 여기에서 메뉴에 대한 추가 처리를 수행할 수 있습니다.
            }
            List<List<MenuCalories>> menuCaloriesList = new ArrayList<>();
            List<MenuCalories> calories = new ArrayList<>();
            String searchTerm = "";
            for (Map.Entry<String, List<MenuCalories>> entry : menuDict.entrySet()) {
                System.out.println("메뉴: " + entry.getKey() + ", 칼로리: " + entry.getValue());
                inputList = generateSubstrings(entry.getKey());
                System.out.println(inputList);
                searchTerm = entry.getKey();

                for (String i : inputList) {
                    System.out.println("인풋값 => " + i);
                    int similarity = LevenshteinDistance.getDefaultInstance().apply(searchTerm, i);
//                    if (similarity <= 2) {
                        try {
                            calories = restaurantService.getMenuCalories(i);
                            if (calories != null) {
                                System.out.println(calories);
                                menuCaloriesList.add(calories);
                            } else {
                                System.out.println(i + "의 칼로리 정보가 없습니다.");
                            }
                        } catch (Exception e) {
                            // 예외 발생 시 무시하고 다음 항목을 처리
                            System.err.println("예외 발생: " + e.getMessage());
                        }
                    }
//                }
                for (List<MenuCalories> menuCaloriesGroup : menuCaloriesList) {
                    menuDict.put(entry.getKey(), menuCaloriesGroup);
                }
//            List<MenuCalories> duplicateMenuCalories = new ArrayList<>();
//            Set<Integer> seenFoodIDs = new HashSet<>();
//
//            for (List<MenuCalories> menuCaloriesGroup : menuCaloriesList) {
//                for (MenuCalories menuCalories : menuCaloriesGroup) {
//                    int foodID = menuCalories.getFoodID();
//                    if (!seenFoodIDs.add(foodID)) {
//                        // 이미 등록된 foodID라면 중복된 것으로 처리
//                        duplicateMenuCalories.add(menuCalories);
//                        System.out.println(duplicateMenuCalories);
//                    }
//                }
//                menuDict.put(entry.getKey(), duplicateMenuCalories);
//            }

                System.out.println(menuDict);
            }
            Map<String, MenuCalories> menuAverages = new HashMap<>();
            for (Map.Entry<String, List<MenuCalories>> entry : menuDict.entrySet()) {
                String menuName = entry.getKey();
                List<MenuCalories> menuCaloriesListt = entry.getValue();

                // 각 성분의 합을 초기화
                int totalCalories = 0;
                int totalCarbs = 0;
                int totalProtein = 0;
                int totalFat = 0;

                // 메뉴에 속하는 모든 MenuCalories 객체의 성분을 더함
                for (MenuCalories menuCalories : menuCaloriesListt) {
                    double amountPerOnce = menuCalories.getAmountperonce();
                    if (amountPerOnce == 0) {
                        amountPerOnce = 1; // amountPerOnce가 0이면 1로 대체
                    }
                    totalCalories += (menuCalories.getCalories() / amountPerOnce) * 100;
                    totalCarbs += (menuCalories.getCarbs() / amountPerOnce) * 100;
                    totalProtein += (menuCalories.getProtein() / amountPerOnce) * 100;
                    totalFat += (menuCalories.getFat() / amountPerOnce) * 100;
                }

                // 성분의 평균 계산
                int numMenuCalories = menuCaloriesListt.size();
                if (numMenuCalories == 0) {
                    numMenuCalories = 1; // amountPerOnce가 0이면 1로 대체
                }
                int avgCalories = totalCalories / numMenuCalories;
                int avgCarbs = totalCarbs / numMenuCalories;
                int avgProtein = totalProtein / numMenuCalories;
                int avgFat = totalFat / numMenuCalories;

                // 평균 성분을 MenuCalories 객체로 생성하여 menuAverages에 저장
                MenuCalories menuAverage = new MenuCalories("", avgCalories, avgCarbs, avgProtein, avgFat, 100);
                menuAverages.put(menuName, menuAverage);
                System.out.println(menuAverages);
            }

        int restauCalories = 0;
        int restauCarbs = 0;
        int restauFat = 0;
        int restauProtein = 0;
        int resauAvgCalories = 0;
        int resauAvgCarbs = 0;
        int resauAvgFat = 0;
        int resauAvgProtein = 0;
        int numMenus = menuAverages.size();

        for (Map.Entry<String, MenuCalories> entry : menuAverages.entrySet()) {
            restauCalories += entry.getValue().getCalories();
            restauCarbs += entry.getValue().getCarbs();
            restauFat += entry.getValue().getFat();
            restauProtein += entry.getValue().getProtein();
        }

        resauAvgCalories = restauCalories/numMenus;
        resauAvgCarbs = restauCarbs/numMenus;
        resauAvgFat = restauFat/numMenus;
        resauAvgProtein = restauProtein/numMenus;

        MenuCalories restaurantInfo = new MenuCalories("", resauAvgCalories, resauAvgCarbs, resauAvgProtein, resauAvgFat, 100);
        System.out.println(restaurantInfo);
        // 칼로리의 평균 계산


            RestaurantResponse response = new RestaurantResponse(restaurant, menuAverages, restaurantInfo);
            return ResponseEntity.ok(response);
        }
}

// 중복된 foodID를 가진 메뉴 칼로리 정보 출력 또는 처리
//            for (MenuCalories duplicate : duplicateMenuCalories) {
//                System.out.println("중복된 foodID: " + duplicate.getFoodID());
//                // 중복된 정보에 대한 처리를 추가하세요.
//            }
//            for (List<MenuCalories> i : menuCaloriesList) {
//                for (MenuCalories ii : i) {
//                    System.out.println(ii); // Print MenuCalories objects
//                }
//            }

