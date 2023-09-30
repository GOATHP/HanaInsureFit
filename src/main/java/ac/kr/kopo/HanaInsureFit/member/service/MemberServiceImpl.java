package ac.kr.kopo.HanaInsureFit.member.service;

import ac.kr.kopo.HanaInsureFit.member.vo.Member;

import java.util.HashMap;
import java.util.List;


import ac.kr.kopo.HanaInsureFit.member.dao.MemberMapper;
import ac.kr.kopo.HanaInsureFit.member.vo.MyPageInfo;
import ac.kr.kopo.HanaInsureFit.member.vo.MyPageInsu;
import ac.kr.kopo.HanaInsureFit.member.vo.UserGrade;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {
    private MemberMapper memberMapper;

    @Autowired
    public MemberServiceImpl(MemberMapper memberMapper) {
        this.memberMapper = memberMapper;
    }

    @Override
    public List<Member> getAllMember() {
        return memberMapper.getAllMember();
    }
    @Override
    public Member selectNameOfMember(String m_id) {
        return memberMapper.selectNameOfMember(m_id);
    }
    @Override
    public Member loginMember(HashMap<String, String> loginData) {
        return memberMapper.loginMember(loginData);
    }

    public int getGrade(String customerID) {
        return memberMapper.getGrade(customerID);
    }
    public MyPageInfo getMyPageInfo(String customerID) {
        return memberMapper.getMyPageInfo(customerID);
    }
    public MyPageInsu getMyPageInsu(String customerID) {
        return memberMapper.getMyPageInsu(customerID);
    }

    public UserGrade getUserGrade(String customerID){
        return memberMapper.getUserGrade(customerID);
    };

    public void regiGrade(@Param("customerID") String customerID, @Param("healthGrade") int healthGrade) {
        memberMapper.regiGrade(customerID, healthGrade);
    }
}