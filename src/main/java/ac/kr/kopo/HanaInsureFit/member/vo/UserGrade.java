package ac.kr.kopo.HanaInsureFit.member.vo;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class UserGrade {
    private int HEALTHGRADE;
    private String REGISTRATIONDATE;

    public UserGrade() {

    }
}
