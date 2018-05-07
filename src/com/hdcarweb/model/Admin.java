package com.hdcarweb.model;

import javax.persistence.*;

@Entity // 注解为hibernate实体
@Table(name="admin") // 注解对应的表�?
public class Admin {
	
	/*@Id	// 注解主键
	@Transient
	@GeneratedValue // id生成策略  默认auto 相当于hibernate的native - 自增字段
	private int id;*/

	@Id
	@Column(name = "user")
	private String username;

	@Column(name = "pass")
	private String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "Admin [username=" + username + ", password=" + password + "]";
	}
	
	
}
