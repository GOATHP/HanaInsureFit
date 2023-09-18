package ac.kr.kopo.HanaInsureFit.healthCare.food.dao;


import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.Food;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.FoodIngredients;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.FoodNames;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.TargetIngre;
import org.apache.ibatis.annotations.Mapper;

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

    List<FoodIngredients> getIngredients();

    List<FoodNames> getFoodNames();

    long getDietID();

    TargetIngre getTargetIngre(String customerID);
}