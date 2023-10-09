package ac.kr.kopo.HanaInsureFit.healthCare.food.dao;


import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.lang.annotation.Target;
import java.util.List;
import java.util.Map;
import java.util.Optional;
@Mapper
public interface FoodMapper {
    Optional<Food> findByName(String foodName);
    List<Food> foodListFindByName(String foodName);
    int checkDuplicate(Map<String, Object> paramMap);
    void insertFoodDietMapping(Map<String, Object> paramMap);
    void insertCustomerDiet(Map<String, Object> paramMap);
    List<FoodIngredients> getIngredients(String customerID);
    List<FoodIngredients> getSelectedIngredients(String customerID);
    List<FoodNames> getFoodNames(String customerID);
    List<FoodNames> getFoodNames2(@Param("recordDate") String recordDate, @Param("customerID") String customerID);
    List<FoodIngredients> getIngredients2(@Param("recordDate") String recordDate, @Param("customerID") String customerID);
    List<FoodNames> getSelectedFoodNames(String customerID);
    long getDietID();
    TargetIngre getTargetIngre(String customerID);
    List<WeekCalories> getWeekCalories(String customerID);
    List<WeekCalories> getWeekCalories2(String customerID);
    List<MenuCalories> getMenuCalories(String menu);
    AvgIngredients getAvgIngre(String customerID);
    void insertSelectedMenu(Map<String, Object> paramMap);



}