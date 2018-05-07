package com.hdcarweb.dao;

import java.util.Map;

import com.hdcarweb.model.Loanreq;

public interface ILoanreqDao extends IBaseDao<Loanreq> {
	public Map<String , Object> getMonthCount();

}
