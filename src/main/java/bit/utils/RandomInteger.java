package bit.utils;

import java.util.Random;
import java.util.function.BiPredicate;

public class RandomInteger {

    public static int nextValue(int min, int max){

        BiPredicate<Integer, Integer> biPredicate = (value1, value2) -> (value2 >= value1);

        if(biPredicate.negate().test(min, max)) new IllegalArgumentException("Min is bigger than Max");

        return new Random().nextInt(max - min + 1) + min;
    }
}
