package ac.kr.kopo.HanaInsureFit.healthCare.food.service;

import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface FoodService {
    List<Food> foodListFindByName(String foodName);
    Food findByName(String foodName);
    int checkDuplicate(Map<String, Object> paramMap);
    void insertFoodDietMapping(Map<String, Object> paramMap);
    void insertCustomerDiet(Map<String, Object> paramMap);
    List<FoodIngredients> getIngredients(String customerID);
    AvgIngredients getAvgIngre(String customerID);
    TargetIngre getTargetIngre(String customerID);
    List<FoodNames> getFoodNames();
    long getDietID();
    List<WeekCalories> getWeekCalories(String customerID);
    List<FoodNames> getFoodNames2(@Param("recordDate") String recordDate, @Param("customerID") String customerID);
    List<FoodIngredients> getIngredients2(@Param("recordDate") String recordDate, @Param("customerID") String customerID);
    List<WeekCalories> getWeekCalories2(String customerID);
    void insertSelectedMenu(Map<String, Object> paramMap);
    List<FoodNames> getSelectedFoodNames(String customerID);
    List<FoodIngredients> getSelectedIngredients(String customerID);
}
