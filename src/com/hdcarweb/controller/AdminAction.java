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

import com.hdcarweb.model.Admin;
import com.hdcarweb.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminAction {
	@Resource 
	private AdminService adminService;
	@RequestMapping(value={"/getAdminByUser/{user}"},method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getAdminByUser(@PathVariable String user){
		Admin admin=adminService.getByUsername(user);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("admin", admin);
		return map;
	}
	@RequestMapping(value={"/updatePassword"},method = RequestMethod.POST)
    public String update(@ModelAttribute Admin admin){
		adminService.update(admin);
		return "index";
	}
}
