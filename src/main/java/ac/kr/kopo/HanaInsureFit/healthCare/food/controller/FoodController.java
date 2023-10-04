package ac.kr.kopo.HanaInsureFit.healthCare.food.controller;

import ac.kr.kopo.HanaInsureFit.healthCare.food.service.FoodService;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.*;
import ac.kr.kopo.HanaInsureFit.member.vo.MyPageInfo;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class FoodController {

    @Autowired
    private FoodService foodService;

    @ResponseBody
    @GetMapping("/stock-searching")
    public ResponseEntity<List<Food>> foodListFindByName(@RequestParam("input") String foodName) {
        List<Food> foodList = foodService.foodListFindByName(foodName);
        System.out.println(foodName);

        for (Food f : foodList) {
            System.out.println(f.getFoodName());
        }
        if (foodList != null && !foodList.isEmpty()) {
            System.out.println(ResponseEntity.ok(foodList));
            return ResponseEntity.ok(foodList);
        } else {

            return ResponseEntity.notFound().build();
        }
    }

    @ResponseBody
    @GetMapping(value = "/stock-search")
    public ResponseEntity<Food> findByName(@RequestParam("input") String foodName) {
        Food food = foodService.findByName(foodName);
        if (food != null) {
            return ResponseEntity.ok(food);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @ResponseBody
    @PostMapping(value = "/weightManage")
    public TargetIngre getTargetIngre(@RequestParam("customerID") String customerID) {
        System.out.println("Controller 여까지옴" + customerID);
        TargetIngre targetIngre = foodService.getTargetIngre(customerID);
        if (targetIngre != null) {
            return targetIngre;
        } else {
            return null;
        }
    }

    @ResponseBody
    @PostMapping(value = "/insertSelectedMenu")
    public String insertSelectedMenu(@RequestBody DataForInsert[] data) {
        System.out.println(data);
//        if (targetIngre != null) {
        for (DataForInsert item : data) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("customerID", item.getCustomerID());
            map.put("mealCode", item.getMealCode());
            map.put("foodName", item.getFoodname());
            map.put("calories", item.getCalories());
            map.put("fat", item.getFat());
            map.put("carbs", item.getCarbs());
            map.put("protein", item.getProtein());
            map.put("amountPerOnce", item.getAmountPerOnce());
            System.out.println(map);
            foodService.insertSelectedMenu(map);
        }
            return "Insert 성공";
//        } else {
//            return null;
//        }
    }

    @ResponseBody
    @PostMapping(value = "/getAvgIngre")
    public AvgIngredients getAvgIngre(@RequestParam("customerID") String customerID) {
        System.out.println("Controller  getAvgIngre  여까지옴" + customerID);
        AvgIngredients avgIngredients = foodService.getAvgIngre(customerID);
        System.out.println("토탈팻" + avgIngredients.getAvg_calories());
        if (avgIngredients != null) {
            return avgIngredients;
        } else {
            return null;
        }
    }

    @SneakyThrows
    @ResponseBody
    @PostMapping("/calandarData")
    public ResponseEntity<String> calandarData(@RequestParam("recordDate") String recordDate, @RequestParam("customerID") String customerID) {
        System.out.println("@@@@@@@" +  customerID + recordDate);
        List<FoodNames> foodNames = foodService.getFoodNames2(recordDate, customerID);
        List<FoodIngredients> ingredients = foodService.getIngredients2(recordDate, customerID);

        Map<String, Object> responseData = new HashMap<>();
        responseData.put("foodNames", foodNames);
        responseData.put("ingredients", ingredients);
        System.out.println("foodNames: " + responseData.get("foodNames"));
        System.out.println("ingredients: " + responseData.get("ingredients"));

        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(responseData);
// ResponseEntity를 사용하여 JSON 형식으로 응답
        return ResponseEntity.ok().body(json);

    }

        @SneakyThrows
    @ResponseBody
    @PostMapping("/loadData")
    public ResponseEntity<String> loadData(@RequestParam("customerID") String customerID) {
        List<FoodNames> foodNames = foodService.getFoodNames();
        List<FoodNames> foodNames2 = foodService.getSelectedFoodNames(customerID);
        List<FoodIngredients> ingredients = foodService.getIngredients(customerID);
        List<FoodIngredients> ingredients2 = foodService.getSelectedIngredients(customerID);
        List<FoodNames> combinedFoodNames = new ArrayList<>(foodNames);
        combinedFoodNames.addAll(foodNames2);

        List<FoodIngredients> combinedIngredients = new ArrayList<>();
        combinedIngredients.addAll(ingredients);
        for (FoodIngredients ingredient2 : ingredients2) {
            boolean matched = false;
            for (FoodIngredients combinedIngredient : combinedIngredients) {
                if (combinedIngredient.getMealCode() == ingredient2.getMealCode() &&
                        combinedIngredient.getRecordDate().equals(ingredient2.getRecordDate())) {
                    // mealCode와 recordDate가 일치하는 항목을 찾았으므로 값을 더합니다.
                    combinedIngredient.setTotal_calories(combinedIngredient.getTotal_calories() + ingredient2.getTotal_calories());
                    combinedIngredient.setTotal_fat(combinedIngredient.getTotal_fat() + ingredient2.getTotal_fat());
                    combinedIngredient.setTotal_carbs(combinedIngredient.getTotal_carbs() + ingredient2.getTotal_carbs());
                    combinedIngredient.setTotal_carbs(combinedIngredient.getTotal_protein() + ingredient2.getTotal_protein());
                    matched = true;
                    break;
                }
            }
            // 일치하는 항목을 찾지 못했으면 새로운 항목으로 추가합니다.
            if (!matched) {
                combinedIngredients.add(ingredient2);
            }
        }
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("foodNames", combinedFoodNames);
        responseData.put("ingredients", combinedIngredients);
        System.out.println("foodNames: " + responseData.get("foodNames"));
        System.out.println("ingredients: " + responseData.get("ingredients"));

        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(responseData);
// ResponseEntity를 사용하여 JSON 형식으로 응답
        return ResponseEntity.ok().body(json);
        // ResponseEntity를 사용하여 JSON 형식으로 응답
    }


    @SneakyThrows
    @ResponseBody
    @PostMapping(value = "/insertDiet")
    public ResponseEntity<String> insertCustomerDiet(@RequestBody dataForDiet data) {
        System.out.println("여까지 진입 라고 할뻔 진입 못함 진입 못함 이슈 잠시대기 ");

        System.out.println(data.getFoodID());

        String customerID = data.getCustomerID();
        String foodID = data.getFoodID();
        double amountPerOnce = data.getAmountPerOnce();
        double weightInput = data.getWeightInput();
        int mealCode = (int) data.getMealCode(); // int로 형변환
        double carbs = data.getCarbs();
        double calories = data.getCalories();
        double protein = data.getProtein();
        double fat = data.getFat();
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("foodID", foodID);
        paramMap.put("customerID", customerID);
        paramMap.put("mealCode", mealCode);
        paramMap.put("weightInput", amountPerOnce);
        paramMap.put("carbs", carbs);
        paramMap.put("calories", calories);
        paramMap.put("protein", protein);
        paramMap.put("fat", fat);
        paramMap.put("customerID", customerID);
        System.out.println("매개변수 확인 => " + paramMap);
        foodService.insertCustomerDiet(paramMap);
        List<FoodNames> foodNames = foodService.getFoodNames();
        List<FoodNames> foodNames2 = foodService.getSelectedFoodNames(customerID);
        List<FoodIngredients> ingredients = foodService.getIngredients(customerID);
        List<FoodIngredients> ingredients2 = foodService.getSelectedIngredients(customerID);
        List<FoodNames> combinedFoodNames = new ArrayList<>(foodNames);
        combinedFoodNames.addAll(foodNames2);
        List<FoodIngredients> combinedIngredients = new ArrayList<>();
        combinedIngredients.addAll(ingredients);

        for (FoodIngredients ingredient2 : ingredients2) {
            boolean matched = false;
            for (FoodIngredients combinedIngredient : combinedIngredients) {
                if (combinedIngredient.getMealCode() == ingredient2.getMealCode() &&
                        combinedIngredient.getRecordDate().equals(ingredient2.getRecordDate())) {
                    // mealCode와 recordDate가 일치하는 항목을 찾았으므로 값을 더합니다.
                    combinedIngredient.setTotal_calories(combinedIngredient.getTotal_calories() + ingredient2.getTotal_calories());
                    combinedIngredient.setTotal_fat(combinedIngredient.getTotal_fat() + ingredient2.getTotal_fat());
                    combinedIngredient.setTotal_carbs(combinedIngredient.getTotal_carbs() + ingredient2.getTotal_carbs());
                    combinedIngredient.setTotal_carbs(combinedIngredient.getTotal_protein() + ingredient2.getTotal_protein());
                    matched = true;
                    break;
                }
            }
            // 일치하는 항목을 찾지 못했으면 새로운 항목으로 추가합니다.
            if (!matched) {
                combinedIngredients.add(ingredient2);
            }
        }
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("foodNames", combinedFoodNames);
        responseData.put("ingredients", combinedIngredients);
        System.out.println("foodNames: " + responseData.get("foodNames"));
        System.out.println("ingredients: " + responseData.get("ingredients"));

//        List<FoodNames> foodNames = foodService.getFoodNames();
//        List<FoodIngredients> ingredients = foodService.getIngredients(customerID);
//        Map<String, Object> responseData = new HashMap<>();
//        responseData.put("foodNames", foodNames);
//        responseData.put("ingredients", ingredients);
//        // 응답 데이터 생성
//        System.out.println("foodNames: " + responseData.get("foodNames"));
//        System.out.println("ingredients: " + responseData.get("ingredients"));
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(responseData);
// ResponseEntity를 사용하여 JSON 형식으로 응답
        return ResponseEntity.ok().body(json);
        // ResponseEntity를 사용하여 JSON 형식으로 응답
    }

    @SneakyThrows
    @ResponseBody
    @PostMapping(value = "/getChartData")
    public ResponseEntity<String> getChartData(@RequestParam("customerID") String customerID) {
        System.out.println(customerID);
        List<WeekCalories> weekCalories = foodService.getWeekCalories(customerID);
        for (WeekCalories w : weekCalories) {
            System.out.println(w.getRecorddate());
            System.out.println(w.getTotal_calories());
        }
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(weekCalories);
        return ResponseEntity.ok().body(json);
    }
    @SneakyThrows
    @ResponseBody
    @PostMapping(value = "/getChartData2")
    public ResponseEntity<String> getChartData2(@RequestParam("customerID") String customerID) {
        System.out.println(customerID);
        List<WeekCalories> weekCalories = foodService.getWeekCalories2(customerID);
        for (WeekCalories w : weekCalories) {
            System.out.println(w.getRecorddate());
            System.out.println(w.getTotal_calories());
        }
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(weekCalories);
        return ResponseEntity.ok().body(json);
    }

}
