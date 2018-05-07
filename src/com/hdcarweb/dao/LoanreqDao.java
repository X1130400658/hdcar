package com.hdcarweb.dao;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.hdcarweb.model.Loanreq;
@Repository("LoanreqDao")
public class LoanreqDao extends BaseDao<Loanreq> implements ILoanreqDao {
	@Resource
    private SessionFactory sessionFactory;
	@Override
	public Map<String, Object> getMonthCount() {
		long loanJan = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 1 and year(c.createTime) = year(now())").uniqueResult();
		long loanFeb = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 2 and year(c.createTime) = year(now())").uniqueResult();
		long loanMar = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 3 and year(c.createTime) = year(now())").uniqueResult();
		long loanApr = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 4 and year(c.createTime) = year(now())").uniqueResult();
		long loanMay = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 5 and year(c.createTime) = year(now())").uniqueResult();
		long loanJun = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 6 and year(c.createTime) = year(now())").uniqueResult();
		long loanJul = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 7 and year(c.createTime) = year(now())").uniqueResult();
		long loanAug = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 8 and year(c.createTime) = year(now())").uniqueResult();
		long loanSep = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 9 and year(c.createTime) = year(now())").uniqueResult();
		long loanOct = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 10 and year(c.createTime) = year(now())").uniqueResult();
		long loanNov = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 11 and year(c.createTime) = year(now())").uniqueResult();
		long loanDec = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Loanreq c where month(c.createTime) = 12 and year(c.createTime) = year(now())").uniqueResult();
		long loanTotal = loanJan+loanFeb+loanMay+loanApr+loanMar+loanJun+loanJul+loanAug+loanSep+loanOct+loanNov+loanDec;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loanJan", loanJan);
		map.put("loanFeb", loanFeb);
		map.put("loanMar", loanMar);
		map.put("loanApr", loanApr);
		map.put("loanMay", loanMay);
		map.put("loanJun", loanJun);
		map.put("loanJul", loanJul);
		map.put("loanAug", loanAug);
		map.put("loanSep", loanSep);
		map.put("loanOct", loanOct);
		map.put("loanNov", loanNov);
		map.put("loanDec", loanDec);
		map.put("loanTotal", loanTotal);
		return map;
	}

}
