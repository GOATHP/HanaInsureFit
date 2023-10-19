package ac.kr.kopo.HanaInsureFit.member.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class GradeChart {
        private int HEALTHGRADE;
        private int GRADE_COUNT;
        public GradeChart() {
    }
}
