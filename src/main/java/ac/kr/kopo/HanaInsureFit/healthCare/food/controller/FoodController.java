package ac.kr.kopo.HanaInsureFit.healthCare.food.controller;

import ac.kr.kopo.HanaInsureFit.healthCare.food.service.FoodService;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.Food;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.FoodIngredients;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.FoodNames;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.dataForDiet;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
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

        for (Food f : foodList){
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
    @SneakyThrows
    @ResponseBody
    @PostMapping(value = "/insertDiet")
    public ResponseEntity<String> insertCustomerDiet(@RequestBody dataForDiet data) {
        System.out.println("여까지 진입");
        System.out.println(data.getId());
        System.out.println(data.getFoodID());

        String foodID = data.getFoodID();
        String customerID = data.getId();

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

        System.out.println("매개변수 확인 => " + paramMap);
        foodService.insertCustomerDiet(paramMap);

        List<FoodNames> foodNames = foodService.getFoodNames();
        List<FoodIngredients> ingredients = foodService.getIngredients();
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("foodNames", foodNames);
        responseData.put("ingredients", ingredients);
        // 응답 데이터 생성

        System.out.println("foodNames: " + responseData.get("foodNames"));
        System.out.println("ingredients: " + responseData.get("ingredients"));
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(responseData);

// ResponseEntity를 사용하여 JSON 형식으로 응답
        return ResponseEntity.ok().body(json);
        // ResponseEntity를 사용하여 JSON 형식으로 응답

    }
}
