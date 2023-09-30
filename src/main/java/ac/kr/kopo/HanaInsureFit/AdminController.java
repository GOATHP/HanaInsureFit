package ac.kr.kopo.HanaInsureFit;

import ac.kr.kopo.HanaInsureFit.member.service.MemberService;
import ac.kr.kopo.HanaInsureFit.member.vo.UserGrade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@Controller
public class AdminController {

        @Autowired
        private MemberService memberService;
//    @PostMapping("/sendAdmin")
//    public ResponseEntity<String> sendAdmin(@RequestParam("customerID") String customerID) {
//        System.out.println("어드민까지 온다.");
//        RestTemplate restTemplate = new RestTemplate();
//        System.out.println("customerID" + customerID);
//        // FastAPI URL
//        String fastApiUrl = "http://3.138.247.51:8000/makeGrade";
//
//        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
//        body.add("customerID", customerID);
//
//        // FastAPI로 POST 요청 보내기
//        ResponseEntity<String> response = restTemplate.postForEntity(fastApiUrl, body, String.class);
//
//        // FastAPI에서 받은 결과를 그대로 반환
//        return ResponseEntity.ok(response.getBody());
//        // Request Body를 위한 Map 생성
////        Map<String, String> body = new HashMap<>();
////        body.put("customerID", customerID);
////        ResponseEntity<String> response = restTemplate.postForEntity(fastApiUrl, body, String.class);
////        System.out.println("response" + response);
////        return ResponseEntity.ok(response.getBody());
//    }
@PostMapping("/sendAdmin")
public UserGrade sendAdmin(@RequestParam("customerID") String customerID) {
    RestTemplate restTemplate = new RestTemplate();
    String fastApiUrl = "http://3.138.247.51:8000/makeGrade";

    // JSON 형식의 요청 데이터
    String requestBody = "{\"customerID\": \"CUST0001\"}";

    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_JSON);

    HttpEntity<String> requestEntity = new HttpEntity<>(requestBody, headers);

    // FastAPI로 POST 요청 보내기
    ResponseEntity<String> response = restTemplate.exchange(fastApiUrl, HttpMethod.POST, requestEntity, String.class);
    System.out.println(response.getBody());

    String responseBody = response.getBody();
    String numericPart = responseBody.replaceAll("[^0-9]", ""); // 숫자가 아닌 문자를 모두 제거
    int healthGrade = Integer.parseInt(numericPart);
    System.out.println("healthGrade: " + healthGrade);
    memberService.regiGrade(customerID, healthGrade);
    UserGrade userGrade = memberService.getUserGrade(customerID);

    // FastAPI에서 받은 결과를 그대로 반환
    return userGrade;
    }
}