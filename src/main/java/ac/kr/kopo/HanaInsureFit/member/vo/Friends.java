package ac.kr.kopo.HanaInsureFit.member.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Friends {
        private String customerID;
        private String friendID;
        public Friends() {
    }
}
