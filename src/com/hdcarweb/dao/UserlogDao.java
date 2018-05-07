package com.hdcarweb.dao;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.hdcarweb.model.Userlog;
@Repository("UserlogDao")
public class UserlogDao extends BaseDao<Userlog> implements IUserlogDao {
	@Resource
    private SessionFactory sessionFactory;
	@Override
	public long getUserlogCount() {
		// TODO Auto-generated method stub
		return (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog").uniqueResult();
	}

	@Override
	public BigInteger getUserCount() {
		// TODO Auto-generated method stub
		return (BigInteger) sessionFactory.getCurrentSession().createSQLQuery("select count(DISTINCT user) from userlog").uniqueResult();
	}

	@Override
	public Map<String, Object> getUserMonthCount() {
		// TODO Auto-generated method stub
		long Jan = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 1 and year(c.createtime) = year(now())").uniqueResult();
		long Feb = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 2 and year(c.createtime) = year(now())").uniqueResult();
		long Mar = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 3 and year(c.createtime) = year(now())").uniqueResult();
		long Apr = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 4 and year(c.createtime) = year(now())").uniqueResult();
		long May = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 5 and year(c.createtime) = year(now())").uniqueResult();
		long Jun = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 6 and year(c.createtime) = year(now())").uniqueResult();
		long Jul = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 7 and year(c.createtime) = year(now())").uniqueResult();
		long Aug = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 8 and year(c.createtime) = year(now())").uniqueResult();
		long Sep = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 9 and year(c.createtime) = year(now())").uniqueResult();
		long Oct = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 10 and year(c.createtime) = year(now())").uniqueResult();
		long Nov = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 11 and year(c.createtime) = year(now())").uniqueResult();
		long Dec = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Userlog c where month(c.createtime) = 12 and year(c.createtime) = year(now())").uniqueResult();
		long total = Jan+Feb+May+Apr+Mar+Jun+Jul+Aug+Sep+Oct+Nov+Dec;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userlogJan", Jan);
		map.put("userlogFeb", Feb);
		map.put("userlogMar", Mar);
		map.put("userlogApr", Apr);
		map.put("userlogMay", May);
		map.put("userlogJun", Jun);
		map.put("userlogJul", Jul);
		map.put("userlogAug", Aug);
		map.put("userlogSep", Sep);
		map.put("userlogOct", Oct);
		map.put("userlogNov", Nov);
		map.put("userlogDec", Dec);
		map.put("userlogTotal", total);
		return map;
	}

}
