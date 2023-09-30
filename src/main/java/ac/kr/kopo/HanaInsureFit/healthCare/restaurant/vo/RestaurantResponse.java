package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo;

import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.MenuCalories;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Map;


@AllArgsConstructor
@Data
@Getter
@Setter
public class RestaurantResponse {
    private Restaurant restaurant;
    private Map<String, MenuCalories> menuIngre;
    private MenuCalories restaurantInfo;
}
