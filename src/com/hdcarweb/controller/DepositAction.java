package com.hdcarweb.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdcarweb.model.Car;
import com.hdcarweb.model.Deposit;
import com.hdcarweb.model.Pager;
import com.hdcarweb.service.CarService;
import com.hdcarweb.service.DepositService;

@Controller
@RequestMapping("/deposit")
public class DepositAction {
	@Resource
	private DepositService depositService;
	@Resource
	private CarService carService;
	@RequestMapping(value={"/getDepositList/{pageNum}/{pageSize}"},method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getDepositList(@PathVariable int pageNum,@PathVariable int pageSize){

		Pager<Deposit> depositList=depositService.getDepositList(pageNum, pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("depositList",depositList);
		System.out.println(map);
		return map;
	}
	@RequestMapping(value={"/getTranno/{listseq}"},method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getDepositList(@PathVariable int listseq){
		List<Deposit> depositList = depositService.getDepositListByListseq(listseq);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("depositList",depositList);
		System.out.println(map);
		return map;
	}
	@RequestMapping(value={"/getDepositByUser/{username}"},method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getDepositByUser(@PathVariable String username){
		List<Deposit> depositList = depositService.getDepositByUser(username);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("depositList",depositList);
		System.out.println(map);
		return map;
	}
}
