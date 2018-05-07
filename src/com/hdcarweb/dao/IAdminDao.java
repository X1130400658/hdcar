package com.hdcarweb.dao;

import java.util.List;

import com.hdcarweb.model.Admin;

public interface IAdminDao extends IBaseDao<Admin> {
	Admin selectbyusername(String username,String pass);
	Admin getByUsername(String username);
	
	public List<Admin> getlist();
}
