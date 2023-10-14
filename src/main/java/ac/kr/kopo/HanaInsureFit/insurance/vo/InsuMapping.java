package ac.kr.kopo.HanaInsureFit.insurance.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class InsuMapping {
    private int insuFee;
    private String selectedInsurances;
    private String customerID;
    public InsuMapping(){
    }
}
