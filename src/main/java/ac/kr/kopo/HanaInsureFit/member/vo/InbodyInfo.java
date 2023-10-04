package ac.kr.kopo.HanaInsureFit.member.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class InbodyInfo {
//        private String InbodyID;
        private float bmi;
        private int bmr;
        private String customerID;
        private float height;
        private String record_date;
        private float weight;
        private int gender;
//        private String identifyNumber;

        public InbodyInfo() {
    }
}
