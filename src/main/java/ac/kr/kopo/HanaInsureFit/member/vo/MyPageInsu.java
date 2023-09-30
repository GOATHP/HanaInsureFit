package ac.kr.kopo.HanaInsureFit.member.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class MyPageInsu {
        private String customerId;
        private String insuranceStartDate;
        private String insuranceEndDate;
        private int insuranceProductNumber;
        private int insuranceCompanyCode;
        private String insuranceProductName;
        private int insuranceFee;
        private String insuranceCompanyName;
        private String insuContent;
        private int minAgeAtRegistration;
        private int maxAgeAtRegistration;
    public MyPageInsu() {
    }
}
