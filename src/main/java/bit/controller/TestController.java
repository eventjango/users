package bit.controller;


import bit.dao.LoanDAO;
import bit.objects.CoinValueFilter;
import bit.vo.ProductVO;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import lombok.extern.java.Log;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Log
@Controller
@RequestMapping("/test")
public class TestController {

    @Autowired
    private LoanDAO loanDAO;
    
    @RequestMapping("/tete")
    public String tetttt(){

        return "test/test_list_invest";
    }
    
    @RequestMapping
    public String testtest(){

        return "test/test";
    }
    
    @RequestMapping("/address")
    public String address(){

        return "test/test_myaddress";
    }
    
    @RequestMapping("/otp")
    public String otp(){

        return "test/test_otp";
    }

    @RequestMapping("/start")
    public String start(){

        return "test";
    }
    
    @RequestMapping("/test")
    public String test(){
    	JSONObject jsonObject = new JSONObject();
    	//jsonObject.put("data", https://api.bithumb.com/public/ticker/btc);
        return jsonObject.toString();
    }


    @RequestMapping(value = "/filter", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    public String testFilterList(@RequestParam Map<String, String> params){

        List<ProductVO> productList = loanDAO.selectProductList("mmm@mmmmmm.com");

        System.out.println(productList);

        productList = CoinValueFilter.filteredList(productList, params);

        System.out.println("filter : " + productList);

        return "loan/listInvestor";
    }

    @RequestMapping(value = "/checkid/{id}", method = RequestMethod.GET)
    public @ResponseBody String pathVariableTest(@PathVariable String id){

        System.out.println(id);

        return id;
    }

    @RequestMapping(value = "/checkParam", method = RequestMethod.GET)
    public @ResponseBody  Map<String, Object> singleParamTest(@RequestParam Map<String, Object> params){

        System.out.println(params);

        /*return new HashMap<String, Object>()
        {
            {
                this.put("id", id);
                this.put("code", code);
            }
        };*/

        return params;
    }


    @RequestMapping(value = "/checkParam", method = RequestMethod.POST)
    public @ResponseBody  Map<String, Object> postParamTest(@RequestParam Map<String, Object> params){

        System.out.println(params);

        /*return new HashMap<String, Object>()
        {
            {
                this.put("id", id);
                this.put("code", code);
            }
        };*/

        return params;
    }

    @RequestMapping(value = "/array", produces = "application/json; charset=utf-8", method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> arrayTest(@RequestParam Map<String, Object> params){

        System.out.println(params);

        return params;
    }

}
