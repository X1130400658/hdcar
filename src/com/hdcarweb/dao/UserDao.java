package com.hdcarweb.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.hdcarweb.model.Dealer;
import com.hdcarweb.model.User;

@Repository("UserDao")
public class UserDao extends BaseDao<User> implements IUserDao{
	@Resource
    private SessionFactory sessionFactory;

	
	@Override
	public User selectbyusername(String username,String pass) {
		// TODO Auto-generated method stub
		return (User) sessionFactory.getCurrentSession().createQuery("from User where username = ? and password = ?")
				.setParameter(0, username)
				.setParameter(1, pass).uniqueResult();
	}

	@Override
	public User getByUsername(String username) {
		// TODO Auto-generated method stub
		return (User) sessionFactory.getCurrentSession().createSQLQuery("select * from user where username=?")
				.addEntity(User.class).setString(0, username).uniqueResult();	
	}
	@Override
	public List<User> getlist() {
		// TODO Auto-generated method stub
		return null;
	}
}
