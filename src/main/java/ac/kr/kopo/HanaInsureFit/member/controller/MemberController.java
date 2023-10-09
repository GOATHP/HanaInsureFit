package ac.kr.kopo.HanaInsureFit.member.controller;

import ac.kr.kopo.HanaInsureFit.member.vo.*;
import ac.kr.kopo.HanaInsureFit.util.weightCheck.OCR.ClovaOCRTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import ac.kr.kopo.HanaInsureFit.member.service.MemberService;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
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
    @PostMapping(value = "/getMyPageInfo2")
    public MyPageInfo getMyPageInfo2(@RequestParam("customerID") String customerID, HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate(); // 세션 무효화
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
    @PostMapping("/checkPhone")
    @ResponseBody
    public String checkPhone(@RequestParam("customerID") String customerID) {
        System.out.println("@@@@@@ 고객 ID" + customerID);
        // Member 객체에 요청 데이터가 매핑됩니다.
        Member member = memberService.selectNameOfMember(customerID);
        String phone = member.getPhoneNum();
        System.out.println(phone);
        String authenticationCode=memberService.sendAuthenticationCode(phone);
        return authenticationCode;
    }
    @PostMapping("/authenticateAction")
    public ResponseEntity<Map<String, String>> authenticate(@RequestParam("image") MultipartFile imageFile) {
        // 업로드된 파일을 임시 파일에 저장
        File tempFile = new File("C:/Users/ajou/Desktop/KOPO/project/데이터/인바디/인바디1.jpg");
        try (OutputStream os = new FileOutputStream(tempFile)) {
            os.write(imageFile.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }

        // Clova OCR API 호출하여 response get
        Map<String, String> extractedData = ClovaOCRTemplate.extractText(tempFile.getAbsolutePath());
        System.out.println("Extracted Data: " + extractedData);
        // Delete the temporary file
        tempFile.delete();

        return ResponseEntity.ok(extractedData);
    }

    @PostMapping("/renewInbody")
    public ResponseEntity<String>  renewInbody(@RequestBody InbodyInfo inbodyInfo) {
        try {
            // 요청으로부터 받은 데이터 처리
            System.out.println(inbodyInfo);
            Member member = memberService.selectNameOfMember(inbodyInfo.getCustomerID());
            if (member == null) {
                // 해당 고객 정보를 찾을 수 없는 경우 예외 처리
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("해당 고객 정보를 찾을 수 없습니다.");
            }

            HashMap<String, Object> paramMap = new HashMap<>();
            paramMap.put("customerID", inbodyInfo.getCustomerID());
            paramMap.put("bmi", inbodyInfo.getBmi());
            paramMap.put("bmr", inbodyInfo.getBmr());
            paramMap.put("height", inbodyInfo.getHeight());
            paramMap.put("weight", inbodyInfo.getWeight());
            paramMap.put("record_date", inbodyInfo.getRecord_date());
            paramMap.put("identifyNum", member.getIdentifyNum());
            paramMap.put("gender", member.getGender());
            paramMap.put("goalCalories", inbodyInfo.getBmr()+500);
            System.out.println(paramMap);
            memberService.insertInbodyInfo(paramMap);
            memberService.updateInbodyInfo(paramMap);
            return ResponseEntity.ok("전송 성공");
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace(); // 예외 상세 정보를 로그에 출력
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류 발생");
        }
    }
    @PostMapping("/insertFriend")
    public ResponseEntity<String> insertFriend(@RequestBody Friends friends) {
        try {
            String friendID = friends.getFriendID();
            String customerID = friends.getCustomerID();
            HashMap<String, String> paramMap = new HashMap<>();
            System.out.println("customerID" + customerID + "friendID" + friendID);
            paramMap.put("customerID", customerID);
            paramMap.put("friendID", friendID);
            memberService.insertFriend(paramMap);
            System.out.println(paramMap);
            return ResponseEntity.ok("전송 완료");
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace(); // 예외 상세 정보를 로그에 출력
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 오류 발생");
        }
    }
    @ResponseBody
    @PostMapping("/getFriendsCount")
    public List<compareWith> getFriendsCount(@RequestParam("customerID") String customerID){
        List<compareWith> getFriends = memberService.getFriendsCount(customerID);
        return getFriends;
    }

    @ResponseBody
    @PostMapping("/getGradeChart")
    public List<GradeChart> GradeChart(){
        List<GradeChart> gradeCharts = memberService.getGradeChart();

        System.out.println(gradeCharts);

        return gradeCharts;
    }

    @ResponseBody
    @PostMapping("/getLineChart")
    public List<AdminLineData> GradeLineChart(){
        List<AdminLineData> GradeLineChart = memberService.getLineChart();

        System.out.println(GradeLineChart);

        return GradeLineChart;
    }
    @ResponseBody
    @PostMapping("/getMyGrade")
    public List<MyGrade> GradeChart(@RequestBody List<String> customerIDs){
        List<MyGrade> gradeCharts = new ArrayList<>();

        for (String customerID : customerIDs) {
            MyGrade grades = memberService.getMyGrade(customerID);
            gradeCharts.add(grades);
        }
        return gradeCharts;
    }
}

