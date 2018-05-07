package com.hdcarweb.dao;

import java.util.List;

import com.hdcarweb.model.Dealer;
import com.hdcarweb.model.Pager;

public interface IDealerDao extends IBaseDao<Dealer> {
	Dealer selectbyusernameAndPassword(String username,String pass);
	Dealer getByUsername(String username);
	public long getTotal();
	public List<Dealer> getlist();
	//Pager<Dealer> getList(int pageNum,int pageSize);
}
