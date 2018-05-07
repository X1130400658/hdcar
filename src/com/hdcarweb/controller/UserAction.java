package com.hdcarweb.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hdcarweb.model.Car;
import com.hdcarweb.model.Deposit;
import com.hdcarweb.model.Pager;
import com.hdcarweb.model.User;
import com.hdcarweb.service.CarService;
import com.hdcarweb.service.DepositService;
import com.hdcarweb.service.UserService;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.request.UploadFileRequest;
import com.qcloud.cos.sign.Credentials;

@Controller
@RequestMapping("/user")
public class UserAction {
	@Resource 
	private UserService userService;
	@Resource 
	private CarService carService;
	@Resource 
	private DepositService depositService;
	@RequestMapping(value={"/buyCar/{id}/{username}/{balance}"},method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> buyCar(@PathVariable int id,@PathVariable String username,@PathVariable int balance){
		Deposit deposit = new Deposit();
		deposit.setAmount((double) 300);
		deposit.setUser(username);
		deposit.setStatus(19);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	
		deposit.setCreatetime(Timestamp.valueOf(sdf.format(date)));
		deposit.setTranplat("虚拟平台");
		deposit.setTrantype("买车保证金转入");
		deposit.setTranref("保存微信商户单号");
		deposit.setNote("备注");
		deposit.setTranno("交易单号");
		Car car = carService.getById(id);
		deposit.setCar(car);
		depositService.depositAdd(deposit);
		car.setStatus(5);
		carService.carUpdate(car);
		User user = userService.getByUsername(username);
		user.setProperty(balance);
		userService.userUpdate(user);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", "success");
		return map;
	}
	@RequestMapping(value = {"/getCarBySearch"}, method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getCarBySearch(HttpServletRequest req) throws UnsupportedEncodingException {
		String kind = req.getParameter("name");
		String str = req.getParameter("str");
		str = new String(str.getBytes("iso8859-1"), "UTF-8");
		/*
		 * String str1 = URLEncoder.encode(str,"utf-8"); String str2 = URLDecoder.decode(str1, "UTF-8"); System.out.println(str1); System.out.println(str2);
		 */
		List<Car> carList=carService.getCarBySearch(kind,str);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("carList", carList);
		return map;
	}
	@RequestMapping(value={"/depositPhoto"},method = RequestMethod.POST)
	
    public String depositPhoto(@RequestParam("photos") MultipartFile[] photos,HttpServletRequest req) throws IOException{
		int i=0;
		String m=req.getParameter("listseq");
		Car car = carService.getById(Integer.parseInt(m));
		car.setStatus(10);
		carService.carUpdate(car);
		String realPath = req.getSession().getServletContext().getRealPath("/resources/upload");
	    for(MultipartFile photo:photos){
			String fileName = photo.getOriginalFilename();
			 // ��ȡͼƬ����չ��
            String extensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
            // �µ�ͼƬ�ļ��� = ��ȡʱ���+"."ͼƬ��չ��
            String newFileName = String.valueOf(System.currentTimeMillis())+ "." + extensionName;
			//String paString=realPath+"\\"+newFileName;
			String paString=realPath+"//"+newFileName;
			File file = new File(realPath+"/"+newFileName);
			FileUtils.copyInputStreamToFile(photo.getInputStream(), file);
			String newName;
			 long appId = 1251224234;
	         String secretId = "AKIDSq47zi1ftwpY7VutpcEh8PUP9tlTJOaa";
	         String secretKey = "znRv7A2jFbmncGk4ED2hBtQnz02vd9Ue";
	         // ����Ҫ������bucket
	         String bucketName = "hdcarfiles";
	        ClientConfig clientConfig = new ClientConfig();
	        // ����bucket���ڵ����򣬱������(gz), ���(tj)
	        clientConfig.setRegion("sh");
	        // ��ʼ����Կ��Ϣ
	        Credentials cred = new Credentials(appId, secretId, secretKey);
	        // ��ʼ��cosClient
	        COSClient cosClient = new COSClient(clientConfig, cred);
	        newName = "T"+m+"_"+i;
	        i=i+1;
	        String cosFilePath = "/prooffiles"+"/"+newName+".png";
	        
	        UploadFileRequest uploadFileRequest = new UploadFileRequest(bucketName, cosFilePath,paString);
	        uploadFileRequest.setEnableSavePoint(false);
	        uploadFileRequest.setEnableShaDigest(false);
	        String uploadFileRet = cosClient.uploadFile(uploadFileRequest);
	        System.out.println("upload file ret:" + uploadFileRet);
	        // �ر��ͷ���Դ
	        cosClient.shutdown();
		}
		return "buyrecord";
	}
@RequestMapping(value={"/refund/{id}"},method = RequestMethod.GET)
	
    public String refund(@PathVariable int id){
		Car car = carService.getById(id);
		int x = car.getStatus();
		if(x==20)
		{
			car.setStatus(98);
		}
		else if(x==3){
			car.setStatus(99);
		}
		else if(x==15){
			car.setStatus(88);
		}
		carService.carUpdate(car);
		String username = depositService.getUser(car);
		User user = userService.getByUsername(username);
		user.setProperty(user.getProperty()+300);
		userService.userUpdate(user);
		return "refundlist";
	}
}
