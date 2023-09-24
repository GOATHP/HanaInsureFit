package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.service;

import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.MenuCalories;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;

import java.util.List;

public interface RestaurantService {
    public List<Restaurant> getRestaurant(String guDong);

    public Restaurant getSelectedRestaurant(String restaurantName);

    List<MenuCalories> getMenuCalories(String menu);

    Integer getRestaurantCalories(String classification2);
}