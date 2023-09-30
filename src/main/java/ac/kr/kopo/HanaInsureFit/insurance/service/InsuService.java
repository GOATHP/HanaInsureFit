package ac.kr.kopo.HanaInsureFit.insurance.service;

import ac.kr.kopo.HanaInsureFit.insurance.vo.Insurance;
import ac.kr.kopo.HanaInsureFit.insurance.vo.insuByCustID;
import ac.kr.kopo.HanaInsureFit.insurance.vo.insuNum;
import org.apache.ibatis.annotations.Param;

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

}