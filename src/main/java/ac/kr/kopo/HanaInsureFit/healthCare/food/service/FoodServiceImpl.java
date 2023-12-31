package ac.kr.kopo.HanaInsureFit.healthCare.food.service;

import ac.kr.kopo.HanaInsureFit.healthCare.food.dao.FoodMapper;
import ac.kr.kopo.HanaInsureFit.healthCare.food.vo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class FoodServiceImpl implements FoodService {
    private FoodMapper foodMapper;

    @Autowired
    public FoodServiceImpl(FoodMapper foodMapper) {

        this.foodMapper = foodMapper;
    }

    @Override
    public List<Food> foodListFindByName(String foodName) {

        List<Food> foodList = new ArrayList<>();

        try {


            foodList = foodMapper.foodListFindByName(foodName);
            // 이름 검색 결과 확인
            for (Food f : foodList) {
                System.out.println(f.getFoodName());
            }
            if (foodList.isEmpty()) {
                foodList = new ArrayList<>();
            }
        } catch (Exception e) {

            e.printStackTrace();
        }

        return foodList;
    }
//    @Override
//    public List<Food> foodListFindByName(String foodName) {
//        System.out.println("FoodServiceImpl =>" + foodName);
//        List<Food> foodList = new ArrayList<>();
//
//        try {
//            foodList = foodMapper.foodListFindByName(foodName);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return foodList;
//    }

    @Override
    public Food findByName(String foodName) {
        Food food = null;
        System.out.println(foodName);
        Optional<Food> foodOptional = null;
        try {
            foodOptional = foodMapper.findByName(foodName);
            // foodOptional.isPresent()를 확인하지 않고 바로 값을 꺼내도록 수정
            food = foodOptional.orElse(null);
            System.out.println(food.getFoodName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return food;
    }

    //    @Override
//    public Food findByName(String foodName) {
//        Food food = null;
//        Optional<Food> foodOptional = null;
//        try {
//            foodOptional = foodMapper.findByName(foodName);
//
//            if (foodOptional.isPresent()) {
//                food = foodOptional.get();
//            } else {
//                foodOptional = null;
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//            return food;
//        }
    @Override
    public void insertFoodDietMapping(Map<String, Object> paramMap) {

        foodMapper.insertFoodDietMapping(paramMap);
    }
    public int checkDuplicate(Map<String, Object> paramMap) {
        return foodMapper.checkDuplicate(paramMap);
    }

    public long getDietID() {
        return foodMapper.getDietID();
    }

    public List<FoodIngredients> getIngredients(String customerID){
        return foodMapper.getIngredients(customerID);
    }

    @Override
    public TargetIngre getTargetIngre(String customerID) {
        return foodMapper.getTargetIngre(customerID);
    }

    public List<FoodNames> getFoodNames(String customerID){
        return foodMapper.getFoodNames(customerID);
    }

    @Override
    public void insertCustomerDiet(Map<String, Object> paramMap) {
        System.out.println(paramMap);
        int duplicateCount = foodMapper.checkDuplicate(paramMap);
        if (duplicateCount == 0) {
            foodMapper.insertCustomerDiet(paramMap);
                foodMapper.insertFoodDietMapping(paramMap);
        } else {
            // 중복이 있는 경우에 대한 처리 로직 추가
            System.out.println("중복 데이터가 이미 존재합니다.");
            foodMapper.insertFoodDietMapping(paramMap);
        }
    }
    public AvgIngredients getAvgIngre(String customerID){
        return foodMapper.getAvgIngre(customerID);
    };
    public List<WeekCalories> getWeekCalories(String customerID) {
        return foodMapper.getWeekCalories(customerID);
    }

    public List<WeekCalories> getWeekCalories2(String customerID) {
        return foodMapper.getWeekCalories2(customerID);
    }
    public void insertSelectedMenu(Map<String, Object> paramMap) {
        foodMapper.insertSelectedMenu(paramMap);
    };

    public List<FoodNames> getSelectedFoodNames(String customerID){
        return foodMapper.getSelectedFoodNames(customerID);
    }
    public List<FoodIngredients> getSelectedIngredients(String customerID){
        return foodMapper.getSelectedIngredients(customerID);
    }

    public List<FoodNames> getFoodNames2(@Param("recordDate") String recordDate, @Param("customerID") String customerID){
        return foodMapper.getFoodNames2(recordDate, customerID);
    }
    public List<FoodIngredients> getIngredients2(@Param("recordDate") String recordDate, @Param("customerID") String customerID){
        return foodMapper.getIngredients2(recordDate, customerID);
    }
}

