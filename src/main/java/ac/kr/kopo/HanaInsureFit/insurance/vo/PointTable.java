package ac.kr.kopo.HanaInsureFit.insurance.vo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor
@Data
@Getter
@Setter
public class PointTable {
    private String customerID;
    private int points;
    private int UsablePoints;
    private String transactionDate;
    private String description;
    public PointTable(){
    }
}
