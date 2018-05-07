package com.hdcarweb.dao;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.hdcarweb.model.Loadprod;
@Repository("LoadProdDao")
public class LoadProdDao extends BaseDao<Loadprod> implements ILoadProdDao{
	@Resource
    private SessionFactory sessionFactory;
}
