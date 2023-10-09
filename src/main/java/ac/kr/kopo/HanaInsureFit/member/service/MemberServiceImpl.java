package ac.kr.kopo.HanaInsureFit.member.service;

import ac.kr.kopo.HanaInsureFit.member.vo.*;

import java.util.HashMap;
import java.util.List;
import java.util.Random;


import ac.kr.kopo.HanaInsureFit.member.dao.MemberMapper;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;


@Service
public class MemberServiceImpl implements MemberService {
    private MemberMapper memberMapper;
    @Value("${coolsms.key}")
    private String apiKey;
    @Value("${coolsms.api_secret}")
    private String api_secret;
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


    @Override
    public void insertInbodyInfo(HashMap<String, Object> paramMap){
        memberMapper.insertInbodyInfo(paramMap);
    };

    @Override
    public void updateInbodyInfo(HashMap<String, Object> paramMap) {
        memberMapper.updateInbodyInfo(paramMap);
    }

    @Override
    public String sendAuthenticationCode(String phone) {
        Message coolsms = new Message(apiKey, api_secret);
        String authenticationCode = createAuthenticationCode();
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("from", "01093660469");
        params.put("to", "01033190457");
        params.put("type", "SMS");
        params.put("text", "[Hana InsureFit] 서비스 이용 인증 번호는"+authenticationCode+"입니다.");
        params.put("app_version", "jcmarket app 1.1");
        try {
            coolsms.send(params);
        } catch (CoolsmsException e) {
            e.printStackTrace();
        }
        return authenticationCode;
    }

    public String createAuthenticationCode() {
        String authenticationCode ="";
        Random randNumber = new Random();
        int codeLength=6;
        for(int i =0;i<codeLength ; i++) {
            String randCode = Integer.toString(randNumber.nextInt(10));
            authenticationCode+=randCode;
        }
        return authenticationCode;
    }

    public void insertFriend(HashMap<String, String> paramMap){
        memberMapper.insertFriend(paramMap);
    }

    public List<compareWith> getFriendsCount(String customerID){

        return memberMapper.getFriendsCount(customerID);
    }

    public MyGrade getMyGrade(String customerID){
        return memberMapper.getMyGrade(customerID);
    }

    public List<GradeChart> getGradeChart(){
        return memberMapper.getGradeChart();
    };

    public List<AdminLineData> getLineChart(){
        return memberMapper.getLineChart();
    };
}
