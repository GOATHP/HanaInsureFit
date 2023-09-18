package ac.kr.kopo.HanaInsureFit.insurance.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class InsertInsu {
    private int insuranceProductNumber;
    private String customerId;
    private String insuranceStartDate;
    private String insuranceEndDate;
    public InsertInsu(){
    }
}
