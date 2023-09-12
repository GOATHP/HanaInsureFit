package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.service;

import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.dao.RestaurantMapper;
import ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo.Restaurant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;


@Service
public class RestaurantServiceImpl implements RestaurantService {
    private RestaurantMapper restaurantMapper;

    @Autowired
    public RestaurantServiceImpl(RestaurantMapper restaurantMapper) {

        this.restaurantMapper = restaurantMapper;
    }

    @Override
    public List<Restaurant> getRestaurant(String guDong) {
        System.out.println("ServiceImpl까지옴");
        System.out.println(guDong);
        return restaurantMapper.getRestaurant(guDong);
    }
}