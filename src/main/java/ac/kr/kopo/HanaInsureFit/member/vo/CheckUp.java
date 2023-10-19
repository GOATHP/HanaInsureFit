package ac.kr.kopo.HanaInsureFit.member.vo;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class CheckUp {
        private int CHK_YEAR;
        private int sex;
        private int HEIGHT;
        private int WEIGHT;
        private int WAIST;
        private int BP_HIGH;
        private int BP_LWST;
        private int BLDS;
        private int HMG;
        private int OLIG_PROTE_CD;
        private int HCHK_OE_INSPEC_YN;
        private int CREATININE;
        private int SGOT_AST;
        private int SGPT_ALT;
        private int GAMMA_GTP;
        private int SMK_STAT_TYPE_CD;
        private int DRK_YN;
        private String customerId;

    public CheckUp() {

    }
}
