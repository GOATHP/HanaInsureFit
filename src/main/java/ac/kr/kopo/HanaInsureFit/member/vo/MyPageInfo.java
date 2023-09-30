package ac.kr.kopo.HanaInsureFit.member.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class MyPageInfo {
        private int healthCheckInfoId;
        private String customerId;
        private String identifyNumber;
        private int height;
        private int weight;
        private int bmi;
        private int basalMetabolicRate;
        private int gender;
        private String checkDate;
        private int gradeId;
        private int healthGrade;
        private String registrationDate;
        private String recordDate;
        private int calories;
        private int protein;
        private int fat;
        private int carbohydrates;
    public MyPageInfo() {
    }
}
