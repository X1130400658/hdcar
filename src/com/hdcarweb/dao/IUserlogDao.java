package com.hdcarweb.dao;

import java.math.BigInteger;
import java.util.Map;

import com.hdcarweb.model.Userlog;

public interface IUserlogDao extends IBaseDao<Userlog> {
	public long getUserlogCount();
	public BigInteger getUserCount();
	public Map<String, Object> getUserMonthCount();
}
