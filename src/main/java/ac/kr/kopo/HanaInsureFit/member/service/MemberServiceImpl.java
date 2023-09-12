package ac.kr.kopo.HanaInsureFit.member.service;

import ac.kr.kopo.HanaInsureFit.member.vo.Member;

import java.util.HashMap;
import java.util.List;


import ac.kr.kopo.HanaInsureFit.member.dao.MemberMapper;
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
}