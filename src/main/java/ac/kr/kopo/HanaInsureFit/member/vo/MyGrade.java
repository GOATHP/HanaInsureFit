package ac.kr.kopo.HanaInsureFit.member.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class MyGrade {
        private String name;
        private String customerID;
        private int healthGrade;
    public MyGrade() {
    }
}
