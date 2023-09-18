package ac.kr.kopo.HanaInsureFit.healthCare.food.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class dataForDiet {
    private String foodID;
    private static long nextDietID = 1;
    private double weightInput;
    private String customerID;
    double amountPerOnce;
    private int mealCode;
    private double calories;
    private double fat;
    private double carbs;
    private double protein;


    public dataForDiet(){

    }
}
