package com.hdcarweb.service;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sun.security.provider.MD5;

import com.hdcarweb.model.Admin;
import com.hdcarweb.model.Dealer;
import com.hdcarweb.util.SafeUtil;
import com.hdcarweb.dao.IAdminDao;
@Service("adminService")
public class AdminService {
	@Autowired
	IAdminDao adminDao;
	public boolean checkAdmin(String username, String pass) {
		return adminDao.selectbyusername(username, pass) != null;
	}
	public Admin getByUsername(String username){
		return adminDao.getByUsername(username);
	}
	/**
	 * ÐÞ¸Ä
	 * @param dealer
	 */
		public void update(Admin admin) {
			admin.setPassword(SafeUtil.md5(admin.getPassword()));
			 adminDao.update(admin);
		}
}
