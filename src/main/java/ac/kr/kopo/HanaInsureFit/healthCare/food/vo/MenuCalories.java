package ac.kr.kopo.HanaInsureFit.healthCare.food.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class MenuCalories {

    private String foodname;
    private int calories;
    private int carbs;
    private int protein;
    private int fat;
    private int amountperonce;
    public MenuCalories() {
    }
}
