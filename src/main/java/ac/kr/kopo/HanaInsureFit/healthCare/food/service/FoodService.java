package ac.kr.kopo.HanaInsureFit.healthCare.food.service;

import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.*;

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

    List<FoodIngredients> getIngredients(String customerID);


    TargetIngre getTargetIngre(String customerID);
    List<FoodNames> getFoodNames();
    long getDietID();

    List<WeekCalories> getWeekCalories();
}