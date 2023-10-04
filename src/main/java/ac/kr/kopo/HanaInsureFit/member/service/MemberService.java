package ac.kr.kopo.HanaInsureFit.member.service;

import ac.kr.kopo.HanaInsureFit.member.vo.Member;
import ac.kr.kopo.HanaInsureFit.member.vo.MyPageInfo;
import ac.kr.kopo.HanaInsureFit.member.vo.MyPageInsu;
import ac.kr.kopo.HanaInsureFit.member.vo.UserGrade;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

public interface MemberService {
    public List<Member> getAllMember();
    Member selectNameOfMember(String id);
    Member loginMember(HashMap<String, String> loginData);
    int getGrade(String customerID);
    MyPageInfo getMyPageInfo(String customerID);

    MyPageInsu getMyPageInsu(String customerID);

    UserGrade getUserGrade(String customerID);

    void insertInbodyInfo(HashMap<String, Object> paramMap);

    void updateInbodyInfo(HashMap<String, Object> paramMap);

    void regiGrade(@Param("customerID") String customerID, @Param("healthGrade") int healthGrade);

    String sendAuthenticationCode(String phone);
}