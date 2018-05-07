package com.hdcarweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdcarweb.dao.IUserDao;
import com.hdcarweb.model.Car;
import com.hdcarweb.model.User;

@Service("userService")
public class UserService {
@Autowired
IUserDao userDao;
public boolean checkUser(String username, String pass) {
	return userDao.selectbyusername(username, pass) != null;
}
public User getByUsername(String username){
	return userDao.getByUsername(username);
}
public void userUpdate(User user) {
	userDao.update(user);
}
}
