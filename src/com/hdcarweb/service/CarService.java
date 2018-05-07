package com.hdcarweb.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdcarweb.dao.ICarDao;
import com.hdcarweb.filter.THreadLocalUtil;
import com.hdcarweb.model.Car;
import com.hdcarweb.model.Pager;

@Service("CarService")
public class CarService {
	@Autowired
	ICarDao carDao;
	/**
	 * ��������
	 * @return
	 */
	public long getListingCount(){
		return carDao.getListingCount();
	}
	/**
	 * ������������
	 * @return
	 */
	public long getListingCountToday(){
		return carDao.getListingCountToday();
	}
	/**
	 * �ɽ�����
	 * @return
	 */
	public long getSuccessOrder(){
		return carDao.getSuccessOrder();
	}
	/**
	 * ��ɽ�����
	 * @return
	 */
	public long getPrepareOrder(){
		return carDao.getPrepareOrder();
	}
	/**
	 * ��ҳ��ѯ
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
		public Pager<Car> getCarList(int pageNum,int pageSize){
			THreadLocalUtil.setPageOffset(pageNum*pageSize);
			THreadLocalUtil.setPageSize(pageSize);
			return carDao.pager("from Car order by id desc");
		}
		public Pager<Car> getCarList2(int pageNum,int pageSize){
			THreadLocalUtil.setPageOffset(pageNum*pageSize);
			THreadLocalUtil.setPageSize(pageSize);
			return carDao.pager("from Car c where c.status = 2 order by id desc");
		}
		public Pager<Car> getCarListByDealer(int pageNum,int pageSize,String name){
			THreadLocalUtil.setPageOffset(pageNum*pageSize);
			THreadLocalUtil.setPageSize(pageSize);
			String hql = "from Car c where c.user='"+name+"' order by id desc";
			System.out.println(hql);
			return carDao.pager(hql);
		}
		
		public List<Car> getCarBySearch(String kind, String str) {
			if (kind.equalsIgnoreCase("1")) {
				String hql = "from Car c where c.brand like '%"+str+"%' and c.status = 2 order by id desc";
				return carDao.list(hql);
			} else
				if (kind.equalsIgnoreCase("2")) {
					String hql = "from Car c where c.type like '%"+str+"%' and c.status = 2 order by id desc";
					return carDao.list(hql);
				} else {
					String hql = "from Car c where c.color like '%"+str+"%' and c.status = 2 order by id desc";
					return carDao.list(hql);
				}
		}
	/**
	 * ���
	 * @param car
	 */
		public void carAdd(Car car) {
			carDao.add(car);
		}
	/**
	 * ɾ��
	 * @param car
	 */
		public void carDelete(Car car) {
			carDao.delete(car);
		}
	/**
	 * ͨ��id��ѯ
	 * @param id
	 * @return
	 */
		public Car getById(int id) {
			return carDao.getById(id);
		}
		/**
		 * ͨ��status��ѯ
		 * @param pageNum
		 * @param pageSize
		 * @param status
		 * @return
		 */
		public Pager<Car> getCarListByStatus(int pageNum,int pageSize,int status){
			THreadLocalUtil.setPageOffset(pageNum*pageSize);
			THreadLocalUtil.setPageSize(pageSize);
			return carDao.pager("from Car where status=? ",status);
		}
		/**
		 * ͨ��status���ѯ
		 * @param pageNum
		 * @param pageSize
		 * @param status
		 * @return
		 */
		public Pager<Car> getCarListByStatusGroup(int pageNum,int pageSize){
			THreadLocalUtil.setPageOffset(pageNum*pageSize);
			THreadLocalUtil.setPageSize(pageSize);
			return carDao.pager("from Car c where c.status in (3,15,20)");
		}
		/**
		 * �޸�
		 * @param car
		 */
			public void carUpdate(Car car) {
				carDao.update(car);
			}
		/**
		 * ��ѯ�����б�
		 * @return
		 */
			public List<Car> getList() {
				return carDao.list("from Car");
			}
			/**
			 * ��ѯ��ͬ�·�������
			 * @return
			 */
			public Map<String, Object> getMonthCount(){
				return carDao.getMonthCount();
			}
}
