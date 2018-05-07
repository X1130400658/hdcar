package com.hdcarweb.dao;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.hdcarweb.model.Car;
import com.hdcarweb.model.Deposit;
import com.hdcarweb.model.Pager;
@Repository("DepositDao")
public class DepositDao extends BaseDao<Deposit> implements IDepositDao {
	@Resource
    private SessionFactory sessionFactory;

	@Override
	public double getSumMoney() {
		// TODO Auto-generated method stub
		if(sessionFactory.getCurrentSession().createQuery("select sum(d.amount) from Deposit d").uniqueResult() != null){
		return (double) sessionFactory.getCurrentSession().createQuery("select sum(d.amount) from Deposit d").uniqueResult();
		}else{
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Deposit> getDepositListByListseq(int listseq) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Deposit where listseq=?").setParameter(0, listseq).list();
	}

	@Override
	public List<Deposit> getDepositByUser(String username) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("from Deposit where user=?").setParameter(0, username).list();
	}

	@Override
	public String getUser(Car car) {
		// TODO Auto-generated method stub
		return (String) sessionFactory.getCurrentSession().createQuery("select d.user from Deposit d where d.car=?").setParameter(0, car).uniqueResult();
	}

}
