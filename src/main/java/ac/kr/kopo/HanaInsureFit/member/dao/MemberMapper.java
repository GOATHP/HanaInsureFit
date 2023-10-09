package ac.kr.kopo.HanaInsureFit.member.dao;


import ac.kr.kopo.HanaInsureFit.member.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Mapper
public interface MemberMapper {
    List<Member> getAllMember();
    Member selectNameOfMember(String m_id);
    Member loginMember(HashMap<String, String> loginData);
    int getGrade(String customerID);
    MyPageInfo getMyPageInfo(String customerID);
    MyPageInsu getMyPageInsu(String customerID);
    UserGrade getUserGrade(String customerID);
    void updateInbodyInfo(HashMap<String, Object> paramMap);
    void insertInbodyInfo(HashMap<String, Object> paramMap);
    void regiGrade(@Param("customerID") String customerID, @Param("healthGrade") int healthGrade);

    void insertFriend(HashMap<String, String> paramMap);

    List<compareWith> getFriendsCount(String customerID);

    MyGrade getMyGrade(String customerID);

    List<GradeChart> getGradeChart();

    List<AdminLineData> getLineChart();
}