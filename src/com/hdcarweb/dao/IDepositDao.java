package com.hdcarweb.dao;

import java.util.List;

import com.hdcarweb.model.Car;
import com.hdcarweb.model.Deposit;

public interface IDepositDao extends IBaseDao<Deposit> {
	public double getSumMoney();
	public List<Deposit> getDepositListByListseq(int listseq);
	public List<Deposit> getDepositByUser(String username);
	public String getUser(Car car);
}
