package ac.kr.kopo.HanaInsureFit.healthCare.weightManage.dao;


import ac.kr.kopo.HanaInsureFit.healthCare.weightManage.vo.WeightManage;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface WeightManageMapper {
    WeightManage getInfo(String id);

}