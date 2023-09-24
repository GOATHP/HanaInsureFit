package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class RestaurantCalories {
    private String classification2;
    private int average_calories;
    public RestaurantCalories() {
    }
}
