package com.hdcarweb.dao;

import com.hdcarweb.model.Pager;
import com.hdcarweb.filter.THreadLocalUtil;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;

import javax.annotation.Resource;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

@SuppressWarnings("unchecked")
public class BaseDao<T> implements IBaseDao<T> {
	
	private SessionFactory sessionFactory;
	private Class<T> cls;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	@Resource(name="sessionFactory")
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	protected Session getcurrentSession(){
		return sessionFactory.getCurrentSession();
	}

	private Class<T> getcls(){
		if(cls==null){
			cls = ((Class<T>)
					(((ParameterizedType)(this.getClass().getGenericSuperclass())).getActualTypeArguments()[0]));
		}
		
		return cls;
	}

	private Query getUqery(String Hql, Object[] args){
		Query query = getcurrentSession().createQuery(Hql);
		if(args!=null){
			for( int i = 0 ; i < args.length ; i ++ ){
				query.setParameter(i, args[i]);
			}
		}
		return query;
	}
	private String getCountHql(String hql,boolean isHql) {
		String e = hql.substring(hql.indexOf("from"));
		String c = "select count(*) "+e;
		if(isHql)
			c.replaceAll("fetch", "");
		return c;
	}
	
	private String getCountHql(String hql) {
		String s = hql.substring(0,hql.indexOf("from"));
		if(s==null||s.trim().equals("")) {
			hql = "select count(*) "+hql;
		} else {
			hql = hql.replace(s, "select count(*) ");
		}
		hql = hql.replace("fetch", "");
		return hql;
	}

	@Override
	public void add(T t){
		getcurrentSession().save(t);
	}
	
	@Override
	public void delete(T t) {
		getcurrentSession().delete(t);
	}
	@Override
	public void update(T t) {
		getcurrentSession().update(t);
	}
	
	@Override
	public T locd(Serializable id) {
		return (T) getcurrentSession().load(getcls(), id);
	}
	@Override
	public List<T> list(String Hql, Object[] objs) {
		return getUqery(Hql, objs).list();
	}
	@Override
	public List<T> list(String Hql, Object objs) {
		return list(Hql,new Object[]{objs});
	}
	@Override
	public List<T> list(String Hql) {
		return  list(Hql,null );
	}
	@Override
	public Object object(String Hql, Object[] objs) {
		return getUqery(Hql, objs).uniqueResult();
	}
	@Override
	public Object object(String Hql, Object objs) {
		
		return object(Hql,new Object[]{objs});
	}
	@Override
	public Object object(String Hql) {
		return object(Hql,null);
	}
	@Override
	public List<Object> listObj(String Hql, Object[] objs) {
		return getUqery(Hql, objs).list();
	}
	@Override
	public List<Object> listObj(String Hql, Object objs) {
		
		return listObj(Hql,new Object[]{objs});
	}
	@Override
	public List<Object> listObj(String Hql) {
		
		return listObj(Hql,null);
	}
	@Override
	public Pager<T> pager(String Hql, Object[] objs) {
		int pageSize = THreadLocalUtil.getPageSize();
		int pageOffset = THreadLocalUtil.getPageOffset();
		Pager<T> pager = new Pager<T>();
		Query query = getUqery(Hql, objs)
		.setFirstResult(pageOffset)
		.setMaxResults(pageSize);
		pager.setObjs(query.list());
		String countHql = getCountHql(Hql);
		long pageCount = (Long)getUqery(countHql,objs).uniqueResult();
		pager.setPageCount(pageCount);
		pager.setPageOffset(pageOffset);
		pager.setPageSize(pageSize);
		return pager;
	}
	
	@Override
	public Pager<T> pager(String Hql, Object objs) {
		
		return pager(Hql,new Object[]{objs});
	}
	@Override
	public Pager<T> pager(String Hql) {
		
		return pager(Hql,null);
	}
	@Override
	public void executeByHql(String hql, Object[] args) {
		getUqery(hql, args).executeUpdate();
	}
	@Override
	public void executeByHql(String hql, Object arg) {
		executeByHql(hql, new Object[]{arg});
		
	}
	@Override
	public void executeByHql(String hql) {
		executeByHql(hql, null);
	}

	@Override
	public Long count(String Hql) {
		return count(Hql, null);

	}

	@Override
	public Long count(String Hql, Object[] objs) {
		String countHql = getCountHql(Hql);
		long pageCount = (Long)getUqery(countHql,objs).uniqueResult();
		return pageCount;
	}
	
	@Override
	public Long countBySql(String Sql, Object[] objs) {
		Query query=getcurrentSession().createSQLQuery(Sql);
		setParameter(query,objs);
		BigInteger count = (BigInteger) query.uniqueResult();
		return count.longValue();
	}

	@Override
	public Long count(String Hql, Object objs) {
		return count(Hql, new Object[]{objs});
	}
	
	@Override
	public <N> Pager<N> pagerBySql(String Sql, Object[] args,  Class<?> cls, boolean isentity) {
		Date start=new Date();
		
		Pager<N> pager = new Pager<N>();
        /* ��ȡ���� */        		
		String countHql = getCountHql(Sql, false);
		SQLQuery query = getcurrentSession().createSQLQuery(countHql);
		setParameter(query, args);
		BigInteger bg = (BigInteger)query.uniqueResult();
		Long pagerCount =  bg.longValue();
		System.out.println(new Date().getTime()-start.getTime());
		
		int pageSize = THreadLocalUtil.getPageSize();
		int pageOffset = THreadLocalUtil.getPageOffset();
		
		/* ��ȡlist */
		query = getcurrentSession().createSQLQuery(Sql);
		setParameter(query, args);
		if(isentity){
			query.addEntity(cls);
		}else{
			query.setResultTransformer(Transformers.aliasToBean(cls));
		}
		List<N> list = query.setFirstResult(pageOffset).setMaxResults(pageSize).list();
		System.out.println(new Date().getTime()-start.getTime());
		System.out.println(list.size());
		
		pager.setObjs(list);
		pager.setPageOffset(pageOffset);
		pager.setPageSize(pageSize);
		pager.setPageCount(pagerCount);
		
		System.out.println(new Date().getTime()-start.getTime());
		return pager;

	}
	
	//lhf
	//�����ѯ��?  ����
	@Override
	public <N> Pager<N> pagerBySqlBygroup(String Hql, Object[] args,  Class<?> cls, boolean isentity) {
		Pager<N> pager = new Pager<N>();

		String countHql = "select count(*) from ("+Hql+") as t";
		SQLQuery query = getcurrentSession().createSQLQuery(countHql);
		setParameter(query, args);
		BigInteger bg = (BigInteger)query.uniqueResult();
		Long pagerCount =  bg.longValue();

		int pageSize = THreadLocalUtil.getPageSize();
		int pageOffset = THreadLocalUtil.getPageOffset();
		query = getcurrentSession().createSQLQuery(Hql);
		setParameter(query, args);
		if(isentity){
			query.addEntity(cls);
		}else{
			query.setResultTransformer(Transformers.aliasToBean(cls));
		}
		List<N> list = query.setFirstResult(pageOffset).setMaxResults(pageSize).list();

		pager.setObjs(list);
		pager.setPageOffset(pageOffset);
		pager.setPageSize(pageSize);
		pager.setPageCount(pagerCount);

		return pager;

	}
    
	@Override
	public <N> List<N> ListBySql(String Hql, Object[] args,  Class<?> cls, boolean isentity) {
		SQLQuery query = getcurrentSession().createSQLQuery(Hql);
		setParameter(query, args);
		if(isentity){
			query.addEntity(cls);
		}else{
			query.setResultTransformer(Transformers.aliasToBean(cls));
		}
		List<N> list = query.list();
		return list;
	}

	/**
	 * ？型查询方式
	 * @param query
	 * @param args
	 */
	private void setParameter(Query query,Object[] args) {
		if(args!=null&&args.length>0&&args[0]!=null) {
			int index = 0;
			for(Object arg:args){
				query.setParameter(index++, arg);
			}
		}
	}

}

