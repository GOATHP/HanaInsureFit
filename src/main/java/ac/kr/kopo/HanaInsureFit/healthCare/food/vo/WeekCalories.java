package ac.kr.kopo.HanaInsureFit.healthCare.food.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class WeekCalories {
    private String recorddate;
    private double total_calories;
    private String customerID;

    public WeekCalories(){

    }
}
