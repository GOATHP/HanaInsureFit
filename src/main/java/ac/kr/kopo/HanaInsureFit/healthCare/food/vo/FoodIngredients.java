package ac.kr.kopo.HanaInsureFit.healthCare.food.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class FoodIngredients {

    private int mealCode;
    private String recordDate;
    private int total_calories;
    private int total_carbs;
    private int total_protein;
    private int total_fat;
    public FoodIngredients() {
    }
}
