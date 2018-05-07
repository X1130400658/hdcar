package com.hdcarweb.dao;

import com.hdcarweb.model.Pager;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface IBaseDao<T> {
	public void add(T t);
	public void delete(T t);
	public void update(T t);
	public T locd(Serializable id);
	
	public List<T> list(String Hql, Object[] objs);
	public List<T> list(String Hql, Object objs);
	public List<T> list(String Hql);
	public Long count(String Hql, Object[] objs);
	public Long count(String Hql, Object objs);
	public Long count(String Hql);
	public  Object object(String Hql, Object[] objs);
	public  Object object(String Hql, Object objs);
	public  Object object(String Hql);
	
	public List<Object> listObj(String Hql, Object[] objs);
	public List<Object> listObj(String Hql, Object objs);
	public List<Object> listObj(String Hql);
	
	
	public Pager<T> pager(String Hql, Object[] objs);
	public Pager<T> pager(String Hql, Object objs);
	public Pager<T> pager(String Hql);
	
	
	public void executeByHql(String hql, Object[] args);
	public void executeByHql(String hql, Object arg);
	public void executeByHql(String hql);
	public <N> Pager<N> pagerBySql(String Hql, Object[] args,  Class<?> cls, boolean isentity);
	
	public <N> Pager<N> pagerBySqlBygroup(String Hql, Object[] args, Class<?> cls,boolean isentity);
	
	public <N> List<N> ListBySql(String Hql, Object[] args,  Class<?> cls, boolean isentity);
	public Long countBySql(String Sql, Object[] objs);

}
