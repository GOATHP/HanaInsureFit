package ac.kr.kopo.HanaInsureFit.insurance.dao;


import ac.kr.kopo.HanaInsureFit.insurance.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface InsuMapper {
    List<Insurance> getAllInsu();
    Insurance getOneInsu(int insuranceProductNumber);
    void insertInsu(Map<String, String> paramMap);
    List<insuNum> insuByCustID(String customerID);
    insuByCustID insuByCustIDList(@Param("insuranceProductNumber") int insuranceProductNumber, @Param("customerId") String customerId);
    List<specialAgree> getInsuSpecial();
    void insertInsuMapping(HashMap<String, Object> paramMap);
    InsuMapping getSpecialInsuMapping(String customerID);
    List<PointTable> getPoint(String customerID);
    void insertPointFood(HashMap<String, Object> paramMap);
    void insertPointInbody(HashMap<String, Object> paramMap);

    void updatePoint(int pointValue);

}