package ac.kr.kopo.HanaInsureFit.member.controller;

import ac.kr.kopo.HanaInsureFit.member.vo.MyPageInfo;
import ac.kr.kopo.HanaInsureFit.member.vo.MyPageInsu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import ac.kr.kopo.HanaInsureFit.member.vo.Member;
import ac.kr.kopo.HanaInsureFit.member.service.MemberService;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MemberController {

    @Autowired
    private MemberService memberService;

    @PostMapping("/getAllMember")
    public ResponseEntity<List<Member>> getAllMember(){
        List<Member> memberList = memberService.getAllMember();
        for (Member i : memberList) {
            System.out.println(i);
        }
        return ResponseEntity.ok(memberList);
    }
    @ResponseBody
    @PostMapping(value = "/getMyPageInfo")
    public MyPageInfo getMyPageInfo(@RequestParam("customerID") String customerID) {
        System.out.println("Controller  getMyPageInfo  여까지옴" + customerID);
        MyPageInfo myPageInfo = memberService.getMyPageInfo(customerID);
        System.out.println("토탈팻" + myPageInfo.getBmi());
        if (myPageInfo != null) {
            return myPageInfo;
        } else {
            return null;
        }
    }

    @ResponseBody
    @PostMapping(value = "/getMyPageInsu")
    public MyPageInsu getMyPageInsu(@RequestParam("customerID") String customerID) {
        System.out.println("Controller  getMyPageInfo  여까지옴" + customerID);
        MyPageInsu myPageInsu = memberService.getMyPageInsu(customerID);
        System.out.println("토탈팻" + myPageInsu.getInsuranceProductName());
        if (myPageInsu != null) {
            return myPageInsu;
        } else {
            return null;
        }
    }

    @PostMapping("/loginMember")
    public ResponseEntity<String> loginMember(@RequestBody HashMap<String, String> loginData, HttpServletRequest request) {
        System.out.println("여기까진 온다. 아님 아님 절대 아님 그거 구라임 절대 안오고 있음 절대 안옴 ");

        System.out.println(loginData);
        Member loginMember = memberService.loginMember(loginData);
        int healthgrade = memberService.getGrade(loginMember.getCustomerID());
        System.out.println(loginMember.getCustomerID());
        HttpSession session = request.getSession();
        if (loginMember!=null) {
            session.setAttribute("healthGrade", healthgrade);
            session.setAttribute("name", loginMember.getName());
            session.setAttribute("customerID", loginMember.getCustomerID());
            session.setAttribute("identifyNum", loginMember.getIdentifyNum());
            session.setAttribute("gender", loginMember.getGender());
            session.setAttribute("age", loginMember.getAge());
            session.setAttribute("email", loginMember.getEmail());
            session.setAttribute("phoneNum", loginMember.getPhoneNum());
            session.setAttribute("password", loginMember.getPassword());
            session.setAttribute("joinDate", loginMember.getJoinDate());
            session.setAttribute("weightGoal", loginMember.getWeightGoal());
            return ResponseEntity.ok("로그인 성공");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("로그인 실패");
        }
    }

    @PostMapping("/logout")
    @ResponseBody // JSON 형식의 응답을 반환
    public Map<String, String> logout(HttpServletRequest request) {
        Map<String, String> response = new HashMap<>();
        try {
            HttpSession session = request.getSession();
            session.invalidate(); // 세션 무효화
            response.put("status", "success");
            response.put("message", "로그아웃 성공");
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "로그아웃 실패: " + e.getMessage());
        }
        return response;
    }
}
