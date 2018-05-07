package com.hdcarweb.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity // 注解为hibernate实体
@Table(name="deposit") // 注解对应的表�?

public class Deposit {
	@Id
	@GeneratedValue // id生成策略  默认auto 相当于hibernate的native - 自增字段
		private int transeq;
		private String tranplat;
		private String tranno;
		private String tranref;
		private String trantype;
		private Double amount;
		private String user;

		private int status;
		private String note;
		private Date createtime;
		
		@ManyToOne()
		@NotFound(action=NotFoundAction.IGNORE)
		@JoinColumn(name="listseq")
		private Car car;
		
		public Double getAmount() {
			return amount;
		}
		public void setAmount(Double amount) {
			this.amount = amount;
		}
		public String getUser() {
			return user;
		}
		public void setUser(String user) {
			this.user = user;
		}
		public int getStatus() {
			return status;
		}
		public void setStatus(int status) {
			this.status = status;
		}
		public String getNote() {
			return note;
		}
		public void setNote(String note) {
			this.note = note;
		}


		public Date getCreatetime() {
			return createtime;
		}
		public void setCreatetime(Date createtime) {
			this.createtime = createtime;
		}
			public Car getCar() {
			return car;
		}
		public void setCar(Car car) {
			this.car = car;
		}
		public int getTranseq() {
			return transeq;
		}
		public void setTranseq(int transeq) {
			this.transeq = transeq;
		}
		public String getTrantype() {
			return trantype;
		}
		public void setTrantype(String trantype) {
			this.trantype = trantype;
		}
		public String getTranplat() {
			return tranplat;
		}
		public void setTranplat(String tranplat) {
			this.tranplat = tranplat;
		}
		public String getTranno() {
			return tranno;
		}
		public void setTranno(String tranno) {
			this.tranno = tranno;
		}
		public String getTranref() {
			return tranref;
		}
		public void setTranref(String tranref) {
			this.tranref = tranref;
		}
		@Override
		public String toString() {
			return "Employee [transeq=" + transeq + ", tranplat=" + tranplat + ", tranno="
					+ tranno + ", tranref=" + tranref + ", trantype=" + trantype + ",amount="+ amount +",user="+user+",status="+status+",note="
					+note+",createtime="+createtime+",car="+car+"]";
		}
		

}
