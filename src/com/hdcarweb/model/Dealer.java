package com.hdcarweb.model;

import javax.persistence.*;

@Entity // 注解为hibernate实体
@Table(name="dealer") // 注解对应的表�?
public class Dealer {

	private String user;
	private String pass;
	private String city;
	private String dname;
	private int status;
	@Id	// 注解主键
	@Column(name = "user", nullable = false)
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Dealer [user=" + user + ", pass=" + pass + ", city=" + city
				+ ", dname=" + dname + ", status=" + status + "]";
	}

}
