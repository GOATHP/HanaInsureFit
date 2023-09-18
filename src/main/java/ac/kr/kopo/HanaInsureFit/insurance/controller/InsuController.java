package ac.kr.kopo.HanaInsureFit.insurance.controller;

import ac.kr.kopo.HanaInsureFit.insurance.service.InsuService;
import ac.kr.kopo.HanaInsureFit.insurance.vo.Insurance;
import ac.kr.kopo.HanaInsureFit.insurance.vo.insuByCustID;
import ac.kr.kopo.HanaInsureFit.insurance.vo.insuNum;
import jdk.swing.interop.SwingInterOpUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class InsuController {

    @Autowired
    private InsuService insuService;

    @ResponseBody
    @PostMapping("/AllInsusearching")
    public ResponseEntity<Map<String, Object>> getAllInsu(HttpServletRequest request) {
        System.out.println("여기까지 왔음 : 보험");
        HttpSession session = request.getSession();

        Map<String, Object> response = new HashMap<>();
        List<Insurance> insuList = insuService.getAllInsu();

        System.out.println(insuList.isEmpty());
        for (Insurance insurance : insuList) {
            System.out.println("보험 상품 번호: " + insurance.getInsuranceProductNumber());
        }
        try {
            response.put("status", "success");
            response.put("data", insuList);
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", e.getMessage());
        }

        return ResponseEntity.ok(response);
    }

    @ResponseBody
    @PostMapping("/Insusearching")
    public ResponseEntity<Insurance> getOneInsu(@RequestParam("input") String insuranceProductNumber, HttpSession session) {
        System.out.println("여까지옴ㅁ밈");


        Insurance insu = insuService.getOneInsu(Integer.parseInt(insuranceProductNumber));
        System.out.println(insu.getInsuranceCompanyCode());
        Map<String, Object> response = new HashMap<>();
        session.setAttribute("insuranceProductNumber", insu.getInsuranceProductNumber());
        session.setAttribute("insuranceCompanyCode", insu.getInsuranceCompanyCode());
        session.setAttribute("insuranceProductName", insu.getInsuranceProductName());
        session.setAttribute("insuranceFee", insu.getInsuranceFee());
        session.setAttribute("insuranceCompanyName", insu.getInsuranceCompanyName());
        session.setAttribute("insuContent", insu.getInsuContent());
        session.setAttribute("minAgeAtRegistration", insu.getMinAgeAtRegistration());
        session.setAttribute("maxAgeAtRegistration", insu.getMaxAgeAtRegistration());
        if (insu != null) {
            return ResponseEntity.ok((Insurance) response);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @ResponseBody
    @PostMapping("/insertInsu")
    public ResponseEntity<String> insertInsu(HttpServletRequest request) {
        try {
            HttpSession session = request.getSession();
            String customerID = (String) session.getAttribute("customerID");
            System.out.println(customerID);
            System.out.println(session.getAttribute("insuranceProductNumber"));
            System.out.println("인서트인슈");

            Integer insuranceProductNumber = (Integer) session.getAttribute("insuranceProductNumber");
            int insuranceProductNumberAsInt = insuranceProductNumber;
            System.out.println(insuranceProductNumberAsInt);

            Map<String, String> paramMap = new HashMap<>();
            paramMap.put("customerID", customerID);
            paramMap.put("insuranceProductNumber", String.valueOf(insuranceProductNumberAsInt));
            insuService.insertInsu(paramMap);
            // 성공적인 응답
            return ResponseEntity.ok("보험 가입이 성공적으로 처리되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            // 실패한 경우
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("보험 가입 중에 오류가 발생했습니다.");
        }
    }

    @ResponseBody
    @PostMapping("/insuByCustID")
    public ResponseEntity<List<insuByCustID>> insuByCustIDList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        String customerID = (String) session.getAttribute("customerID");
        System.out.println(customerID);
        List<insuNum> insuProductNumbers = insuByCustID(customerID);
        List<insuByCustID> resultList = new ArrayList<>();

        for (insuNum num : insuProductNumbers) {
            System.out.println(num); // 또는 num.toString()을 사용하여 출력
            insuByCustID result = insuService.insuByCustIDList(num.getInsuranceProductNumber());
            System.out.println(result);
            if (result != null) {
                resultList.add(result);
            }
        }
//        for (insuNum insuranceProductNumber : insuProductNumbers) {
//            insuByCustID result = (insuByCustID) insuService.insuByCustIDList(insuranceProductNumber.getInsuranceProductNumber()); // insuService에서 해당 정보 가져오는 메서드 호출
//            System.out.println(result);
//            if (result != null) {
//                resultList.add(result);
//            }
//        }

        if (!resultList.isEmpty()) {
            return ResponseEntity.ok(resultList);
        } else {
            return ResponseEntity.notFound().build();
        }}
    public List<insuNum> insuByCustID(String customerID) {
         // insuService에서 가져온 데이터를 리스트에 추가
        return insuService.insuByCustID(customerID);
    }
}