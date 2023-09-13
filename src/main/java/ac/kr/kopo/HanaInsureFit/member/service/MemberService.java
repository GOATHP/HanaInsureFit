package ac.kr.kopo.HanaInsureFit.member.service;

import ac.kr.kopo.HanaInsureFit.member.vo.Member;

import java.util.HashMap;
import java.util.List;

public interface MemberService {
    public List<Member> getAllMember();
    Member selectNameOfMember(String id);
    Member loginMember(HashMap<String, String> loginData);

    int getGrade(String customerID);
}