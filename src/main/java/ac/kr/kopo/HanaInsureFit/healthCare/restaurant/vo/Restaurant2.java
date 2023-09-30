package ac.kr.kopo.HanaInsureFit.healthCare.restaurant.vo;

import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.MenuCalories;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class Restaurant2 {
    private Long id; // 데이터베이스에서 자동 생성되는 고유 식별자

    private String name;
    private String score;
    private String location;
    private String dishes;
    private Long views;
    private Long stars;
    private Long phone;
    private String imgUrl;
    private String store_introduction;
    private String classification;
    private String classification2;
    private String takeOrNot;
    private String linqurOrNot;
    private String homepage;
    private String operation_hours;
    private String menu;
    private String address;
    private String phone_number;
    private MenuCalories restaurantInfo;
    public Restaurant2() {
    }
}
