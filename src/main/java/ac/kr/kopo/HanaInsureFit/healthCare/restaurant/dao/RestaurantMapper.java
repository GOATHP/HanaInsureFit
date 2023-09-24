package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.dao;


import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface RestaurantMapper {
    List<Restaurant> getRestaurant(String guDong);
    Restaurant getSelectedRestaurant(String restaurantName);

    Integer getRestaurantCalories(String classification2);

}