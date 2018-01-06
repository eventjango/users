package bit.utils;


import java.util.regex.Pattern;


public class PatternCheck {
    /**
     * word check
     * @param input
     * @return
     */
    public boolean wordCheck(String input){ return Pattern.matches("[a-zA-Z]+", input); }

    public PatternValue wordCheckAndResultData(String input){
        return new PatternValue(input, wordCheck(input));
    }

    public boolean integerCheck(String input){ return input.matches("(?:\\d)?\\d+"); }

    public PatternValue integerCheckAndResultData(String input){
        return new PatternValue(input, integerCheck(input));
    }

    public boolean floatNumberCheck(String input){ return Pattern.matches("(?:\\d*\\.)?\\d+", input); }

    public PatternValue floatNumberCheckAndResultData(String input){
        return new PatternValue(input, floatNumberCheck(input));
    }

    public boolean notWordCheck(String input){
        return input.matches("\\W+");
    }

    public PatternValue notWordCheckAndResultData(String input){
        return new PatternValue(input, notWordCheck(input));
    }
}
