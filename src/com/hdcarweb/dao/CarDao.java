package com.hdcarweb.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.hdcarweb.filter.THreadLocalUtil;
import com.hdcarweb.model.Car;
import com.hdcarweb.model.Pager;
@Repository("CarDao")
public class CarDao extends BaseDao<Car> implements ICarDao {
	@Resource
    private SessionFactory sessionFactory;

	@Override
	public long getListingCountToday() {
		// TODO Auto-generated method stub
		return (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where day(c.createTime) = day(now()) and month(c.createTime) = month(now())").uniqueResult();
	}

	@Override
	public long getSuccessOrder() {
		// TODO Auto-generated method stub
		return (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where c.status = 15").uniqueResult();
	}

	@Override
	public long getPrepareOrder() {
		// TODO Auto-generated method stub
		return (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where c.status < 15").uniqueResult();
	}

	@Override
	public long getListingCount() {
		// TODO Auto-generated method stub
		return (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c").uniqueResult();
	}


	@Override
	public Car getById(int id) {
		// TODO Auto-generated method stub
		return (Car) sessionFactory.getCurrentSession().createQuery("from Car where listseq=?").setParameter(0, id).uniqueResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Pager<Car> pagerByStatus(String Hql, int[] status) {
		// TODO Auto-generated method stub
		int pageSize = THreadLocalUtil.getPageSize();
		int pageOffset = THreadLocalUtil.getPageOffset();
		Pager<Car> pager = new Pager<Car>();
		Query query = sessionFactory.getCurrentSession().createQuery(Hql).setParameter(0, status[0]).setParameter(1, status[1]).setParameter(2, status[2])
				.setFirstResult(pageOffset)
				.setMaxResults(pageSize);
				pager.setObjs(query.list());
				String countHql = "select count(*) from Car c where status=? or status=? or status=?";
				long pageCount = (Long)sessionFactory.getCurrentSession().createQuery(countHql).setParameter(0, status[0]).setParameter(1, status[1]).setParameter(2, status[2]).uniqueResult();
				System.out.println(pageCount);
				pager.setPageCount(pageCount);
				pager.setPageOffset(pageOffset);
				pager.setPageSize(pageSize);
				return pager;
	}
	@Override
	public Map<String, Object> getMonthCount(){
		long Jan = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 1 and year(c.createTime) = year(now())").uniqueResult();
		long Feb = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 2 and year(c.createTime) = year(now())").uniqueResult();
		long Mar = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 3 and year(c.createTime) = year(now())").uniqueResult();
		long Apr = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 4 and year(c.createTime) = year(now())").uniqueResult();
		long May = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 5 and year(c.createTime) = year(now())").uniqueResult();
		long Jun = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 6 and year(c.createTime) = year(now())").uniqueResult();
		long Jul = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 7 and year(c.createTime) = year(now())").uniqueResult();
		long Aug = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 8 and year(c.createTime) = year(now())").uniqueResult();
		long Sep = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 9 and year(c.createTime) = year(now())").uniqueResult();
		long Oct = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 10 and year(c.createTime) = year(now())").uniqueResult();
		long Nov = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 11 and year(c.createTime) = year(now())").uniqueResult();
		long Dec = (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Car c where month(c.createTime) = 12 and year(c.createTime) = year(now())").uniqueResult();
		long total = Jan+Feb+May+Apr+Mar+Jun+Jul+Aug+Sep+Oct+Nov+Dec;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Jan", Jan);
		map.put("Feb", Feb);
		map.put("Mar", Mar);
		map.put("Apr", Apr);
		map.put("May", May);
		map.put("Jun", Jun);
		map.put("Jul", Jul);
		map.put("Aug", Aug);
		map.put("Sep", Sep);
		map.put("Oct", Oct);
		map.put("Nov", Nov);
		map.put("Dec", Dec);
		map.put("Total", total);
		return map;
	}

}
