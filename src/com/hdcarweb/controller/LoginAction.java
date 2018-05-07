package com.hdcarweb.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;



















import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdcarweb.filter.EncoderByMd5;
import com.hdcarweb.model.Admin;
import com.hdcarweb.model.Dealer;
import com.hdcarweb.model.User;
import com.hdcarweb.service.AdminService;
import com.hdcarweb.service.CarService;
import com.hdcarweb.service.DealerService;
import com.hdcarweb.service.DepositService;
import com.hdcarweb.service.LoanreqService;
import com.hdcarweb.service.UserService;
import com.hdcarweb.service.UserlogService;

@Controller
@RequestMapping("/login")
public class LoginAction {
	@Resource
	private AdminService adminService;
	@Resource
	private DealerService dealerService;
	@Resource
	private UserService userService;
	@Resource
	private CarService carService;
	@Resource
	private DepositService depositService;
	@Resource
	private UserlogService userlogService;
	@Resource
	private LoanreqService loanreqService;
	@RequestMapping(value="/check")
    @ResponseBody
    public Map<String, Object> check(String username, String password,String idname,HttpServletRequest req) throws NoSuchAlgorithmException{
		Map<String, Object> map = new HashMap<String, Object>();
		String pass = EncoderByMd5.md5(password);
		  if (idname.equalsIgnoreCase("admin")) {
			   
			  if (adminService.checkAdmin(username, pass)){
				  System.out.println(carService.getListingCountToday());
				  Admin admin = adminService.getByUsername(username);
				  map.put("msg", "success");
				  map.put("user", admin.getUsername());
				  map.put("status", 0);
				  map.put("carCount", carService.getListingCount());
				  map.put("carNewCount", carService.getListingCountToday());
				  map.put("order", carService.getSuccessOrder());
				  map.put("orderPrepare", carService.getPrepareOrder());
				  map.put("dealerCount", dealerService.getTotal());
				  map.put("sumMoney", depositService.getSumMoney());
				  map.put("userlogCount", userlogService.getUserlogCount());
				  map.put("userCount", userlogService.getUserCount());
				  map.putAll(carService.getMonthCount());
				  map.putAll(loanreqService.getMonthCount());
				  map.putAll(userlogService.getUserMonthCountMap());
				  HttpSession session = req.getSession();
				  session.setAttribute("test", admin.getUsername());
				  return map;
			  }else {
				  map.put("msg", "fasle");
				  	return map;
			}
		  } else if(idname.equalsIgnoreCase("dealer")){
			  if (dealerService.checkDealer(username, pass)){
				  
				  Dealer dealer = dealerService.getByUsername(username);
				  map.put("msg", "success");
				  map.put("user", dealer.getUser());	
				  map.put("status", 1);
				  HttpSession session = req.getSession();
				  session.setAttribute("test", dealer.getUser());
				  return map;
			  }else {
				  map.put("msg", "fasle");
				  	return map;
			}
		  } else{
			  if (userService.checkUser(username, pass)){
				  
				  User user = userService.getByUsername(username);
				  map.put("msg", "success");
				  map.put("user", user.getUsername());
				  map.put("money", user.getProperty());
				  map.put("status", 2);
				  return map;
			  }else {
				  map.put("msg", "fasle");
				  	return map;
			}
		  }
	}
}
