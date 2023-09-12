package ac.kr.kopo.HanaInsureFit.healthCare.food.service;

import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.Food;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.FoodIngredients;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.FoodNames;

import java.util.List;
import java.util.Map;

public interface FoodService {

    // 종목 검
    // 종목 검색 중
    List<Food> foodListFindByName(String foodName);
    Food findByName(String foodName);

//    void insertFoodDietMapping(@Param("foodID") String foodID, @Param("dietID") long dietID, double weightInput);
    int checkDuplicate(Map<String, Object> paramMap);

    void insertFoodDietMapping(Map<String, Object> paramMap);

    void insertCustomerDiet(Map<String, Object> paramMap);

    List<FoodIngredients> getIngredients();

    List<FoodNames> getFoodNames();
    long getDietID();
}