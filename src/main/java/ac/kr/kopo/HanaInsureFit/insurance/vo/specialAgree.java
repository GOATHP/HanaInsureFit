package ac.kr.kopo.HanaInsureFit.insurance.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class specialAgree {
    private int premium;
    private String COVERAGEITEMNAME;

    public specialAgree(){

    }
}
