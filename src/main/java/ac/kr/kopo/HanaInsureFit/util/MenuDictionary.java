package ac.kr.kopo.HanaInsureFit.util;

import ac.kr.kopo.HanaInsureFit.healthCare.food.dao.FoodMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MenuDictionary {


    private FoodMapper foodMapper;

    public static Map<String, Integer> createMenuDictionary(String input) {
        Map<String, Integer> menuDictionary = new HashMap<>();

        String[] menuItems = input.split(", ");
        for (String menuItem : menuItems) {
            menuDictionary.put(menuItem, 0);
        }

        return menuDictionary;
    }
    public static List<String> generateSubstrings(String input) {
        int length = input.length();
        List<String> inputList = new ArrayList<>();
        for (int start = 0; start < length; start++) {
            for (int end = start + 1; end <= length; end++) {
                String substring = input.substring(start, end);
                inputList.add(substring);
            }
        }
        return inputList;
    }
}

