package com.hdcarweb.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hdcarweb.model.Car;
import com.hdcarweb.model.Pager;
import com.hdcarweb.service.CarService;
import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.request.DelFileRequest;
import com.qcloud.cos.request.UploadFileRequest;
import com.qcloud.cos.sign.Credentials;

@Controller
@RequestMapping("/car")
public class CarAction {
		private static final Map<String, Object> SUCCESS = null;
		@Resource
		private CarService carService;
		@RequestMapping(value={"/getCarList/{pageNum}/{pageSize}"},method = RequestMethod.GET)
	    @ResponseBody
	    public Map<String, Object> getCarList(@PathVariable int pageNum,@PathVariable int pageSize){

			Pager<Car> carList=carService.getCarList(pageNum, pageSize);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("carList", carList);
			return map;
		}
		@RequestMapping(value={"/getCarList2/{pageNum}/{pageSize}"},method = RequestMethod.GET)
	    @ResponseBody
	    public Map<String, Object> getCarList2(@PathVariable int pageNum,@PathVariable int pageSize){

			Pager<Car> carList=carService.getCarList2(pageNum, pageSize);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("carList", carList);
			return map;
		}
		@RequestMapping(value={"/getCarListByDealer/{pageNum}/{pageSize}/{name}"},method = RequestMethod.GET)
	    @ResponseBody
	    public Map<String, Object> getCarList(@PathVariable int pageNum,@PathVariable int pageSize,@PathVariable String name){

			Pager<Car> carList=carService.getCarListByDealer(pageNum, pageSize,name);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("carList", carList);
			System.out.println(map);
			return map;
		}
		@RequestMapping(value={"/carAdd"},method = RequestMethod.POST)
	
	    public String carAdd(@ModelAttribute Car car,@RequestParam("photos") MultipartFile[] photos,HttpServletRequest req) throws IOException{
			int i=0;
			String realPath = req.getSession().getServletContext().getRealPath("/resources/upload");
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	
			car.setCreateTime(Timestamp.valueOf(sdf.format(date)));
			car.setPicsno(photos.length);
			carService.carAdd(car);
		    int m=car.getListseq();
		    for(MultipartFile photo:photos){
				System.out.println(realPath+"\\"+photo.getOriginalFilename());
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
		        if(i==0){
		        	newName = Integer.toString(m);
		        }
		        else{
		        	newName = Integer.toString(m)+"_"+i;
		        }
		        i=i+1;
		        String cosFilePath = "/listingfiles"+"/"+newName+".png";
		        
		        UploadFileRequest uploadFileRequest =
		        new UploadFileRequest(bucketName, cosFilePath,paString);
		        uploadFileRequest.setEnableSavePoint(false);
		        uploadFileRequest.setEnableShaDigest(false);
		        String uploadFileRet = cosClient.uploadFile(uploadFileRequest);
		        System.out.println("upload file ret:" + uploadFileRet);
		        // �ر��ͷ���Դ
		        cosClient.shutdown();
			}
			return "carlist";
		}
		
		@RequestMapping(value={"/carDelete"},method = RequestMethod.GET)
	
	    public String carDelete(HttpServletRequest req){
			String listseq=req.getParameter("listseq");
			Car car=carService.getById(Integer.parseInt(listseq));
			int sta = car.getStatus();
			if(sta==0||sta==2){
			 int b=car.getPicsno();
			 for(int i=0;i<b;i++){
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
	     if(i==0){
	    	 newName = Integer.toString(Integer.parseInt(listseq));
	     }
	     else{
	    	 newName = Integer.toString(Integer.parseInt(listseq))+"_"+i;
	     }
	       String cosFilePath = "/listingfiles"+"/"+newName+".png";
	    
			  DelFileRequest delFileRequest = new DelFileRequest(bucketName, cosFilePath);
		        String delFileRet = cosClient.delFile(delFileRequest);
		        System.out.println("del file ret:" + delFileRet);
			 }
			carService.carDelete(car);
			return "carlist";
			}else{
				return "carlist";
			}
		}
		@RequestMapping(value={"/carCheck/{pageNum}/{pageSize}"},method = RequestMethod.GET)
	    @ResponseBody
	    public Map<String, Object> carCheck(@PathVariable int pageNum,@PathVariable int pageSize){
			Pager<Car> carList=carService.getCarListByStatus(pageNum, pageSize, 5);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("carList", carList);
			return map;
		}
		@RequestMapping(value={"/refundList/{pageNum}/{pageSize}"},method = RequestMethod.GET)
	    @ResponseBody
	    public Map<String, Object> refundList(@PathVariable int pageNum,@PathVariable int pageSize){
			Pager<Car> carList=carService.getCarListByStatusGroup(pageNum, pageSize);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("carList", carList);
			return map;
		}
		@RequestMapping(value={"/checkDeposit/{pageNum}/{pageSize}"},method = RequestMethod.GET)
	    @ResponseBody
	    public Map<String, Object> checkDeposit(@PathVariable int pageNum,@PathVariable int pageSize){

			Pager<Car> carList=carService.getCarListByStatus(pageNum, pageSize, 10);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("carList", carList);
			return map;
		}
		@RequestMapping(value={"/carCheckPass"},method = RequestMethod.GET)
	    public String carCheckPass(HttpServletRequest req){
			String listseq=req.getParameter("listseq");
			Car car=carService.getById(Integer.parseInt(listseq));
			car.setStatus(7);
			carService.carUpdate(car);
			return "carcheck";
		}
		@RequestMapping(value={"/carCheckUnpass"},method = RequestMethod.POST)		
	    public String carCheckUnpass(HttpServletRequest req){
			String listseq=req.getParameter("listseq");
			
			String note=req.getParameter("note");
			Car car=carService.getById(Integer.parseInt(listseq));
			car.setStatus(20);
			car.setNote(note);
			carService.carUpdate(car);
			return "carcheck";
		}
		@RequestMapping(value={"/changePrice"},method = RequestMethod.POST)		
	    public String changePrice(HttpServletRequest req){
			String listseq=req.getParameter("listseq");		
			String price=req.getParameter("price");
			Car car=carService.getById(Integer.parseInt(listseq));
			car.setPrice(Integer.parseInt(price));
			carService.carUpdate(car);
			return "carlist";
		}
		@RequestMapping(value={"/carDetail/{listseq}"},method = RequestMethod.GET)		
	    public Map<String, Object> carDetail(@PathVariable int listseq){
			Car car=carService.getById(listseq);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("car",car);
			return map;
		}
		@RequestMapping(value={"/refundSuccess"},method = RequestMethod.GET)
	    public String refundSuccess(HttpServletRequest req){
			String listseq=req.getParameter("listseq");
			Map<String, Object> map = new HashMap<String, Object>();
			Car car=carService.getById(Integer.parseInt(listseq));
			int x=car.getStatus();
			
			if(x==20)
			{
				car.setStatus(98);
				carService.carUpdate(car);
			}
			else if(x==3){
				car.setStatus(99);
				carService.carUpdate(car);
			}
			else if(x==15){
				car.setStatus(88);
				carService.carUpdate(car);
			}
			map.put("status", "success");
			return "refundlist";
		}
		
		@RequestMapping(value={"/checkDepositPass"},method = RequestMethod.GET)		
	    public String checkDepositPass(HttpServletRequest req){
			String listseq=req.getParameter("listseq");
			Car car=carService.getById(Integer.parseInt(listseq));
			car.setStatus(15);
			carService.carUpdate(car);
			return "depositCheck";
		}
		@RequestMapping(value={"/checkDepositUnpass"},method = RequestMethod.GET)		
	    public String checkDepositUnpass(HttpServletRequest req){
			String listseq=req.getParameter("listseq");
			Car car=carService.getById(Integer.parseInt(listseq));
			car.setStatus(11);
			carService.carUpdate(car);
			return "depositCheck";
		}
		@InitBinder  
	    public void initBinder(WebDataBinder binder) {  
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");  
	        dateFormat.setLenient(false);  
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  
	    }  
}
