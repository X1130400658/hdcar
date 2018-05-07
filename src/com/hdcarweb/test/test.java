package com.hdcarweb.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hdcarweb.dao.ICarDao;
@RunWith(SpringJUnit4ClassRunner.class) 
@ContextConfiguration(locations="classpath:beans.xml") 
public class test {
	@Autowired
	private ICarDao carDao;
	@Test
	public void testCase() {
		System.out.println("test");
		System.out.println(carDao.getListingCount());
	}
}
