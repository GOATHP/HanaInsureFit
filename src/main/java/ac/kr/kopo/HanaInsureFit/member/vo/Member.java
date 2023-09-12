package ac.kr.kopo.HanaInsureFit.member.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@Getter
@Setter
public class Member {
    private String customerID;
    private String name;
    private String identifyNum;
    private int gender;
    private int age;
    private String email;
    private String phoneNum;
    private String password;
    private String joinDate;
    private int weightGoal;
    public Member() {
    }
}
