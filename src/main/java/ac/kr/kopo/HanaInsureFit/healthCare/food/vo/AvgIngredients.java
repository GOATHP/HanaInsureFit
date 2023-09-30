package ac.kr.kopo.HanaInsureFit.healthCare.food.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class AvgIngredients {


    private int avg_calories;
    private int avg_carbs;
    private int avg_fat;
    private int avg_protein;
    public AvgIngredients() {
    }
}
