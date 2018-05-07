package com.hdcarweb.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.hdcarweb.model.Admin;
@Repository("AdminDao")
public class AdminDao extends BaseDao<Admin> implements IAdminDao {
	@Resource
    private SessionFactory sessionFactory;

	
	@Override
	public Admin selectbyusername(String username,String pass) {
		// TODO Auto-generated method stub
		return (Admin) sessionFactory.getCurrentSession().createQuery("from Admin where username = ? and password = ?")
				.setParameter(0, username)
				.setParameter(1, pass).uniqueResult();
	}
	@Override
	public Admin getByUsername(String username){
		return (Admin) sessionFactory.getCurrentSession().createSQLQuery("select * from admin where user=?")
				.addEntity(Admin.class).setString(0, username).uniqueResult();	
	}
	@Override
	public List<Admin> getlist() {
		// TODO Auto-generated method stub
		return null;
	}

}
