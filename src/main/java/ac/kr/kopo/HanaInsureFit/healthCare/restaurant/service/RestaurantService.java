package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.service;

import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.MenuCalories;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;
import org.apache.ibatis.annotations.Param;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

public interface RestaurantService {
    public List<Restaurant> getRestaurant(String guDong);

    public Restaurant getSelectedRestaurant(String restaurantName) throws UnsupportedEncodingException;

    List<MenuCalories> getMenuCalories(String menu);

    Integer getRestaurantCalories(String classification2);


    void updateNutritionBatch(@Param("menuCaloriesMap") Map<String, Integer> menuCaloriesMap, @Param("restaurantName")  String restaurantName);
}