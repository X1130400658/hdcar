package com.hdcarweb.dao;



import java.util.List;
import java.util.Map;

import com.hdcarweb.model.Car;
import com.hdcarweb.model.Pager;

public interface ICarDao extends IBaseDao<Car> {
	public long getListingCount();
	public long getListingCountToday();
	public long getSuccessOrder();
	public long getPrepareOrder();
	public Car getById(int id);
	public Pager<Car> pagerByStatus(String Hql, int status[]);
	public Map<String, Object> getMonthCount();
}
