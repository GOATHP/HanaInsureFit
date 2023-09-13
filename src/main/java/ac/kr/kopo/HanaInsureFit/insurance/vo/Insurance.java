package ac.kr.kopo.HanaInsureFit.insurance.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class Insurance {
    private long insuranceProductNumber;
    private int insuranceCompanyCode;
    private String insuranceProductName;
    private double insuranceFee;
    private String insuranceCompanyName;
    private String insuContent;
    private int minAgeAtRegistration;
    private int maxAgeAtRegistration;

    public Insurance(){

    }
}
