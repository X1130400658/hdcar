package com.hdcarweb.dao;

import java.io.Serializable;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.hdcarweb.model.Admin;
import com.hdcarweb.model.Dealer;
import com.hdcarweb.model.Pager;
@Repository("DealerDao")
public class DealerDao extends BaseDao<Dealer> implements IDealerDao {
	@Resource
    private SessionFactory sessionFactory;

	@Override
	public Dealer selectbyusernameAndPassword(String username, String pass) {
		// TODO Auto-generated method stub
		return (Dealer) sessionFactory.getCurrentSession().createQuery("from Dealer where user=? and pass=?")
				.setParameter(0, username)
				.setParameter(1, pass).uniqueResult();
	}

	@Override
	public Dealer getByUsername(String username) {
		// TODO Auto-generated method stub
		return (Dealer) sessionFactory.getCurrentSession().createSQLQuery("select * from dealer where user=?")
				.addEntity(Dealer.class).setString(0, username).uniqueResult();	
	}

	@Override
	public List<Dealer> getlist() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public long getTotal() {
		// TODO Auto-generated method stub
		return (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Dealer").uniqueResult();
	}

}
