package com.hdcarweb.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdcarweb.dao.ILoanreqDao;

@Service("LoanreqService")
public class LoanreqService {
	@Autowired
	ILoanreqDao loanreqDao;
	/**
	 * 查询不同月份汽车数量
	 * @return
	 */
	public Map<String, Object> getMonthCount(){
		return loanreqDao.getMonthCount();
	}
}
