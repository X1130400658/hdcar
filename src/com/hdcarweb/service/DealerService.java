package com.hdcarweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdcarweb.dao.IDealerDao;
import com.hdcarweb.model.Dealer;
import com.hdcarweb.model.Pager;
import com.hdcarweb.filter.THreadLocalUtil;
@Service("DealerService")
public class DealerService {
	@Autowired
		IDealerDao dealerDao;
	/**
	 * ���̵�¼
	 * @param username
	 * @param pass
	 * @return
	 */
		public boolean checkDealer(String username,String pass){
			return dealerDao.selectbyusernameAndPassword(username, pass) !=null;
		}
		/**
		 * ͨ���û������
		 * @param username
		 * @return
		 */
		public Dealer getByUsername(String username){
			return dealerDao.getByUsername(username);
		}
	/**
	 * ��������
	 * @return
	 */
		public long getTotal(){
			return dealerDao.getTotal();
		}
	/**
	 * ��ҳ��ѯ
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
		public Pager<Dealer> getDealerList(int pageNum,int pageSize){
			THreadLocalUtil.setPageOffset(pageNum*pageSize);
			THreadLocalUtil.setPageSize(pageSize);
			return dealerDao.pager("from Dealer order by id desc");
		}
	/**
	 * �޸�
	 * @param dealer
	 */
		public void update(Dealer dealer) {
			 dealerDao.update(dealer);
		}
		/**
		 * ���
		 * @param dealer
		 */
	public void add(Dealer dealer) {
			dealerDao.add(dealer);
	}
	public List<Dealer> getDealer() {
		return dealerDao.list("from Dealer");
	}
}
