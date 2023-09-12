package ac.kr.kopo.HanaInsureFit.healthCare.weightManage.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class WeightManage {
    private String id; // 데이터베이스에서 자동 생성되는 고유 식별자
    private String name;
    private int height;
    private int weight;
    private int age;
    private int bmi;
    private int goalCal;
    private int protein;
    private int fat;
    private int carbohydrates;
    public WeightManage() {
    }
}
