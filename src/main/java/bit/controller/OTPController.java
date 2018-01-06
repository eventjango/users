package bit.controller;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base32;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.service.interfaces.Auth;
import bit.vo.LoginVO;

@Controller
public class OTPController {

	@Autowired
	private Auth authService;
	
    @RequestMapping(value = "/otp/get", method = RequestMethod.POST)
    @ResponseBody
    public String generateKey(HttpSession session){

    	JSONObject jsonObject = new JSONObject();
        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        /**
         * buffer 할당
         * secretSize + numOfScratchCodes * scratchCodeSize
         */
        byte[] buffer = new byte[5 + 5 * 5];
        new Random().nextBytes(buffer);

        /**
         * key 생성
         */
        Base32 codec = new Base32();

        byte[] secretKey = Arrays.copyOf(buffer, 5);
        byte[] bEncodedKey = codec.encode(secretKey);
        long time = new Date().getTime();

        //BASE64Encoder base64Encoder = new BASE64Encoder();
        String encodedKey = new String(bEncodedKey);
        
        //System.out.println(encodedKey);
        
        String url = getBarcodeURL(loginVO.getId()/*, "test.com"*/, encodedKey);

        //System.out.println(url);
        
        jsonObject.put("encodedKey", encodedKey);
        jsonObject.put("url", url);

        return jsonObject.toString();
    }
    
    @RequestMapping(value = "/otp/check", method = RequestMethod.POST)
    @ResponseBody
    public String checkKey(HttpSession session){

    	JSONObject jsonObject = new JSONObject();
        LoginVO loginVO = (LoginVO) session.getAttribute("login");

        String id = loginVO.getId();
        
        String encodedKey = authService.getEncodeKey(id); 
        
        
        String url = getBarcodeURL(loginVO.getId()/*, "test.com"*/, encodedKey);

        //System.out.println(url);
        
        jsonObject.put("encodedKey", encodedKey);
        jsonObject.put("url", url);

        return jsonObject.toString();
    }


    @RequestMapping(value = "/otp/result", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
//    public String resultCheck(@RequestParam("key") String encodedKey,@RequestParam("code") String code) throws Exception{
    public String resultCheck(@RequestBody HashMap<String,String> params,HttpSession session) throws Exception{

    	JSONObject jsonObject = new JSONObject();
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	
    	String encodedKey = params.get("key");
    	String code = params.get("code");
    	//System.out.println(encodedKey + "," + code);
        long userCode = Integer.parseInt(code);

        long time = new Date().getTime();
        time = time/30000;
        
        //System.out.println(time);

        boolean checkCode = false;

        /*try {
            // 키, 코드, 시간으로 일회용 비밀번호가 맞는지 일치 여부 확인.
            checkCode = checkCode(encodedKey, userCode, time);

        } catch (InvalidKeyException e) {
            e.printStackTrace();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }*/
        checkCode = checkCode(encodedKey, userCode, time);
        
        // 일치한다면 true.
        //System.out.println("checkCode : " + checkCode);
        jsonObject.put("state", checkCode);
        if(checkCode) {
        	HashMap<String, String> param = new HashMap<>();
        	param.put("id", id);
        	param.put("key", encodedKey);
       		authService.insertOTP(param);
       		authService.updateOTP(param);
        }
        

        return jsonObject.toString();
    }
    
    @RequestMapping(value = "/otp/check/result", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
    @ResponseBody
    public String CheckResult(@RequestBody HashMap<String,String> params,HttpSession session) throws Exception{

    	JSONObject jsonObject = new JSONObject();
    	
    	LoginVO loginVO = (LoginVO) session.getAttribute("login");
    	
    	String id = loginVO.getId();
    	
    	
    	String encodedKey = params.get("key");
    	String code = params.get("code");
    	//System.out.println(encodedKey + "," + code);
        long userCode = Integer.parseInt(code);

        long time = new Date().getTime();
        time = time/30000;
        
        //System.out.println(time);

        boolean checkCode = false;

        checkCode = checkCode(encodedKey, userCode, time);
        
        jsonObject.put("state", checkCode);
        

        return jsonObject.toString();
    }


    private boolean checkCode(String secretKey, long code, long time) throws NoSuchAlgorithmException, InvalidKeyException{

        Base32 codec = new Base32();

        byte[] decodedKey = codec.decode(secretKey.getBytes());

        int window = 3;
        for (int i = -window; i <= window; ++i) {
            long hash = verifyCode(decodedKey, time + i);

            if (hash == code) {
                return true;
            }
        }

        return false;
    }

    private int verifyCode(byte[] key, long t) throws NoSuchAlgorithmException, InvalidKeyException {
        byte[] data = new byte[8];
        long value = t;
        for (int i = 8; i-- > 0; value >>>= 8) {
            data[i] = (byte) value;
        }

        SecretKeySpec signKey = new SecretKeySpec(key, "HmacSHA1");
        Mac mac = Mac.getInstance("HmacSHA1");
        mac.init(signKey);
        byte[] hash = mac.doFinal(data);

        int offset = hash[20 - 1] & 0xF;

        // We're using a long because Java hasn't got unsigned int.
        long truncatedHash = 0;
        for (int i = 0; i < 4; ++i) {
            truncatedHash <<= 8;
            // We are dealing with signed bytes:
            // we just keep the first byte.
            truncatedHash |= (hash[offset + i] & 0xFF);
        }

        truncatedHash &= 0x7FFFFFFF;
        truncatedHash %= 1000000;

        return (int) truncatedHash;
    }


    private String getBarcodeURL(String userId/*, String host*/, String secretKey){

        //String format =  "http://chart.apis.google.com/chart?cht=qr&amp;chs=300x300&amp;chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&amp;chld=H|0";
    	String format = "http://chart.apis.google.com/chart?cht=qr&amp;chs=150x150&amp;chl=otpauth://totp/%s%%3Fsecret%%3D%s&amp;chld=H|0";
        return String.format(format, userId/*, host*/, secretKey);
    }




}
