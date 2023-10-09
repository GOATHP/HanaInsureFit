package ac.kr.kopo.HanaInsureFit.member.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class AdminLineData {
        private String JOINDATE;
        private int CUSTOMER_COUNT;
        public AdminLineData() {
    }
}
