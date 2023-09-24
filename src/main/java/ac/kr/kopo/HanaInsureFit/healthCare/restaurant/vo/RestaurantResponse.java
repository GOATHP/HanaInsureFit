package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class RestaurantResponse {
    private Restaurant restaurant;
    private Integer calories;
    public RestaurantResponse() {
    }
}
