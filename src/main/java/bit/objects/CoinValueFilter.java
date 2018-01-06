package bit.objects;

import bit.vo.ProductVO;

import java.util.List;
import java.util.Map;
import static java.util.stream.Collectors.*;

public class CoinValueFilter {

    public static List<ProductVO> filteredList(List<ProductVO> productList, Map<String, String> target){

        List<String> targetList =
                target.values()
                        .stream()
                        .map(n -> n.toString())
                        .collect(toList());

        return CoinValueFilter.filteredList(productList, targetList);
    }

    public static List<ProductVO> filteredList(List<ProductVO> productList, List<String> targetList){

        if(targetList.isEmpty()) return productList;

        productList =
        productList
                .stream()
                .filter(n -> {
                    boolean result = false;

                    for (String value : targetList){
                        if(value.equals(n.getCoinValue())) result = true;
                    }

                    return result;
                })

                .collect(toList());

        return productList;
    }
}
