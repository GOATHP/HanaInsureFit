package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.service;

import ac.kr.kopo.HanaInsureFit.healthCare.food.dao.FoodMapper;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.MenuCalories;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.dao.RestaurantMapper;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RestaurantServiceImpl implements RestaurantService {
    private RestaurantMapper restaurantMapper;
    private FoodMapper foodMapper;

    @Autowired
    public RestaurantServiceImpl(RestaurantMapper restaurantMapper, FoodMapper foodMapper) {

        this.restaurantMapper = restaurantMapper;
        this.foodMapper = foodMapper;
    }

    @Override
    public List<Restaurant> getRestaurant(String guDong) {
        System.out.println(guDong);
        return restaurantMapper.getRestaurant(guDong);
    }

    @Override
    public Restaurant getSelectedRestaurant(String restaurantName) {
        return restaurantMapper.getSelectedRestaurant(restaurantName);
    }

    @Override
    public List<MenuCalories> getMenuCalories(String menu) {
        System.out.println(menu);
        return foodMapper.getMenuCalories(menu);

    }

    public Integer getRestaurantCalories(String classification2) {
        Integer calories = restaurantMapper.getRestaurantCalories(classification2); // 레스토랑의 평균 칼로리를 가져옴
        if (calories != null) {
            return calories; // 평균 칼로리 출력
        } else {
            return 1; // null이면 1 출력
        }
    }
}