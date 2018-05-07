package com.hdcarweb.dao;

import java.util.List;

import com.hdcarweb.model.User;

public interface IUserDao extends IBaseDao<User>{
	User selectbyusername(String username,String pass);
	User getByUsername(String username);
	public List<User> getlist();
}
