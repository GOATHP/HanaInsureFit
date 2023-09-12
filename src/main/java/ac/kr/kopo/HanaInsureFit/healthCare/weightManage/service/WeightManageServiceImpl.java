package ac.kr.kopo.HanaInsureFit.healthCare.weightManage.service;

import ac.kr.kopo.HanaInsureFit.healthCare.weightManage.dao.WeightManageMapper;
import ac.kr.kopo.HanaInsureFit.healthCare.weightManage.vo.WeightManage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class WeightManageServiceImpl implements WeightManageService {
    private WeightManageMapper weightManageMapper;

    @Autowired
    public WeightManageServiceImpl(WeightManageMapper weightManageMapper) {

        this.weightManageMapper = weightManageMapper;
    }

    @Override
    public WeightManage getInfo(String id) {
        System.out.println("ServiceImpl까지옴");
        System.out.println(id);
        return weightManageMapper.getInfo(id);
    }
}