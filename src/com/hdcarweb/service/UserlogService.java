package com.hdcarweb.service;

import java.math.BigInteger;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdcarweb.dao.IUserlogDao;

@Service("Userlogservice")
public class UserlogService {
	@Autowired
	private IUserlogDao userlogDao;
	public BigInteger getUserCount(){
		return userlogDao.getUserCount();
	}
	public long getUserlogCount() {
		return userlogDao.getUserlogCount();
	}
	public Map<String , Object> getUserMonthCountMap() {
		return userlogDao.getUserMonthCount();
	}
}
