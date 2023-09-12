package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.service;

import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;

import java.util.HashMap;
import java.util.List;

public interface RestaurantService {
    public List<Restaurant> getRestaurant(String guDong);
}