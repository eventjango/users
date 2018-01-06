package bit.utils;

import lombok.Data;

@Data
public class PatternValue {

    String output;
    boolean result;

    PatternValue(String output, boolean result){
        this.output = output;
        this.result = result;
    }
}
