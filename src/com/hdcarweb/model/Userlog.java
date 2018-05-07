package com.hdcarweb.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="userlog")
public class Userlog {
	@Id
	@GeneratedValue
	@Column(name = "logseq")
	private int logseq;
	private String user;
	private Date createtime;
	public int getLogseq() {
		return logseq;
	}
	public void setLogseq(int logseq) {
		this.logseq = logseq;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	@Override
	public String toString() {
		return "Userlog [logseq=" + logseq + ", user=" + user + ", createtime="
				+ createtime + "]";
	}
	
}
