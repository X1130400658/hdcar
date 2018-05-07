package com.hdcarweb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdcarweb.dao.ILoadProdDao;
import com.hdcarweb.filter.THreadLocalUtil;
import com.hdcarweb.model.Loadprod;
import com.hdcarweb.model.Pager;

@Service("LoadProdService")
public class LoadProdService {
		@Autowired
		ILoadProdDao loadProdDao;
		/**
		 * ∑÷“≥≤È—Ø
		 * @param pageNum
		 * @param pageSize
		 * @return
		 */
		public Pager<Loadprod> getLoadProdList(int pageNum,int pageSize) {
			THreadLocalUtil.setPageOffset(pageNum*pageSize);
			THreadLocalUtil.setPageSize(pageSize);
			return loadProdDao.pager("from Loadprod order by id desc");
		}
		/**
		 * ÃÌº”
		 * @param loadprod
		 */
		public void loadprodAdd(Loadprod loadprod){
			loadProdDao.add(loadprod);
		}
}
