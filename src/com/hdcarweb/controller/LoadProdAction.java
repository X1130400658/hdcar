package com.hdcarweb.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdcarweb.model.Dealer;
import com.hdcarweb.model.Loadprod;
import com.hdcarweb.model.Pager;
import com.hdcarweb.service.DealerException;
import com.hdcarweb.service.LoadProdService;

@Controller
@RequestMapping("/loadprod")
public class LoadProdAction {
	@Resource
	private LoadProdService loadProdService;
	@RequestMapping(value={"/getLoadprodList/{pageNum}/{pageSize}"},method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getDealerList(@PathVariable int pageNum,@PathVariable int pageSize){

		Pager<Loadprod> loadprodList=loadProdService.getLoadProdList(pageNum, pageSize);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loadprodList", loadprodList);
		System.out.println(map);
		return map;
	}
	@RequestMapping(value={"/add"},method = RequestMethod.POST)
    public String add(@ModelAttribute Loadprod loadprod){
		loadProdService.loadprodAdd(loadprod);
		return "loadprodlist";
	}
}
