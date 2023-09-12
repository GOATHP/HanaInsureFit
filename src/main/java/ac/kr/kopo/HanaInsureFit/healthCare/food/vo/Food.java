package ac.kr.kopo.HanaInsureFit.healthCare.food.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class Food {
    private String foodID; // 데이터베이스에서 자동 생성되는 고유 식별자
    private String foodName;
    private int allAmount;
    private int amountPerOnce;
    private int weightInput;
    private int calories;
    private int protein;
    private int fat;
    private int carbs;
    public Food() {
    }
}
