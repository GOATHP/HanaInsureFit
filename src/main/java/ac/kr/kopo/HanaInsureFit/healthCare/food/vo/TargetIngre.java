package ac.kr.kopo.HanaInsureFit.healthCare.food.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class TargetIngre {
    private int calories;
    private int protein;
    private int fat;
    private int carbohydrates;
    public TargetIngre() {
    }
}
