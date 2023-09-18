package ac.kr.kopo.HanaInsureFit.insurance.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class insuByCustID {
    private int insuranceProductNumber;
    private int insuranceCompanyCode;
    private String insuranceProductName;
    private double insuranceFee;
    private String insuranceCompanyName;
    private String insuContent;
    private int minAgeAtRegistration;
    private int maxAgeAtRegistration;
    private String customerID;
    private String insuranceStartDate;
    private String insuranceEndDate;

    public insuByCustID(){
    }
}
