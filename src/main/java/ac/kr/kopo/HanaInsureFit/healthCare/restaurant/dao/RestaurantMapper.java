package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.dao;


import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface RestaurantMapper {
    List<Restaurant> getRestaurant(String guDong);
    Restaurant getSelectedRestaurant(String restaurantName);

    Integer getRestaurantCalories(String classification2);

    void updateNutritionBatch(@Param("menuCaloriesMap") Map<String, Integer> menuCaloriesMap,@Param("restaurantName")  String restaurantName);
}