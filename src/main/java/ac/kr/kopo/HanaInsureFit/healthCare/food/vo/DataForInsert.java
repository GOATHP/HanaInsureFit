package ac.kr.kopo.HanaInsureFit.healthCare.food.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Data
@Getter
@Setter
public class DataForInsert {
    private String foodname;
    private String customerID;
    private int amountPerOnce;
    private int mealCode;
    private int calories;
    private int fat;
    private int carbs;
    private int protein;

    public DataForInsert(){

    }
}
