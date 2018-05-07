package com.hdcarweb.controller;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.security.provider.MD5;
import cn.jpush.api.report.UsersResult.User;

import com.hdcarweb.filter.EncoderByMd5;
import com.hdcarweb.model.Dealer;
import com.hdcarweb.model.Pager;
import com.hdcarweb.service.DealerException;
import com.hdcarweb.service.DealerService;

@Controller
@RequestMapping("/dealer")
public class DealerAction {
	@Resource
	private DealerService dealerService;
	@RequestMapping(value={"/getDealerList/{pageNum}/{pageSize}"},method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getDealerList(@PathVariable int pageNum,@PathVariable int pageSize){

		Pager<Dealer> dealerList=dealerService.getDealerList(pageNum, pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dealerList", dealerList);
		System.out.println(map);
		return map;
	}
	@RequestMapping(value={"/getDealerByUser/{user}"},method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getDealerByUser(@PathVariable String user){
		Dealer dealer=dealerService.getByUsername(user);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dealer", dealer);
		return map;
	}
	@RequestMapping(value={"/add"},method = RequestMethod.POST)
    public String add(@ModelAttribute Dealer dealer) throws NoSuchAlgorithmException{
		if(dealerService.getByUsername(dealer.getUser())!=null)
		{
			throw new DealerException("用户名已存在！");
		}
		String pass = dealer.getPass();
		dealer.setPass(EncoderByMd5.md5(pass));
		dealerService.add(dealer);
		return "dealerlist";
	}
	@RequestMapping(value={"/update"},method = RequestMethod.POST)
    public String update(@ModelAttribute Dealer dealer){
		dealerService.update(dealer);
		return "dealerlist";
	}
	@ExceptionHandler(value={DealerException.class})
	public String handlerException(DealerException e,HttpServletRequest req){
		req.setAttribute("e", e);
		return "dealerlist";
	}
	@RequestMapping(value={"/getDealer/{status}"},method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getDealer(@PathVariable int status){

		List<Dealer> dealerList=dealerService.getDealer();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dealerList", dealerList);
		map.put("msg", status);
		System.out.println(map);
		return map;
	}
}
