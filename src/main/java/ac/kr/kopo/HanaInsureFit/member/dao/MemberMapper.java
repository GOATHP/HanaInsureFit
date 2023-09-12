package ac.kr.kopo.HanaInsureFit.member.dao;


import ac.kr.kopo.HanaInsureFit.member.vo.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Mapper
public interface MemberMapper {
    List<Member> getAllMember();
    Member selectNameOfMember(String m_id);
    Member loginMember(HashMap<String, String> loginData);
}