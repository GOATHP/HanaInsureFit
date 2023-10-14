package ac.kr.kopo.HanaInsureFit.insurance.service;

import ac.kr.kopo.HanaInsureFit.insurance.vo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InsuService {

    // 종목 검
    // 종목 검색 중
    List<Insurance> getAllInsu();
    Insurance getOneInsu(int insuranceProductNumber);

    void insertInsu(Map<String, String> paramMap);

    List<insuNum> insuByCustID(String customerID);

    insuByCustID insuByCustIDList(@Param("insuranceProductNumber") int insuranceProductNumber, @Param("customerId") String customerId);

    List<specialAgree> getInsuSpecial();

    InsuMapping getSpecialInsuMapping(String customerID);
    void insertInsuMapping(HashMap<String, Object> paramMap);

    List<PointTable> getPoint(String customerID);
    void insertPointFood(HashMap<String, Object> paramMap);
    void insertPointInbody(HashMap<String, Object> paramMap);

}