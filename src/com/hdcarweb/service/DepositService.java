package com.hdcarweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdcarweb.dao.IDepositDao;
import com.hdcarweb.filter.THreadLocalUtil;
import com.hdcarweb.model.Car;
import com.hdcarweb.model.Deposit;
import com.hdcarweb.model.Pager;
@Service("DepositService")
public class DepositService {
	@Autowired
	IDepositDao depositDao;
	/**
	 * �տ���
	 * @return
	 */
	public double getSumMoney(){
		return depositDao.getSumMoney();
	}
	/**
	 * ��ҳ��ѯ
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public Pager<Deposit> getDepositList(int pageNum,int pageSize) {
		THreadLocalUtil.setPageOffset(pageNum*pageSize);
		THreadLocalUtil.setPageSize(pageSize);
		return depositDao.pager("from Deposit order by id desc");
	}
	public List<Deposit> getDepositListByListseq(int listseq) {
		return depositDao.getDepositListByListseq(listseq);
	}
	public List<Deposit> getDepositByUser(String username) {
		return depositDao.getDepositByUser(username);
	}
	public void depositAdd(Deposit deposit) {
		depositDao.add(deposit);
	}
	public String getUser(Car car){
		return depositDao.getUser(car);
	}
}
