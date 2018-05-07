package com.hdcarweb.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="loanreq")
public class Loanreq {
	@Id
	@GeneratedValue // id生成策略  默认auto 相当于hibernate的native - 自增字段
	@Column(name = "loanseq", nullable = false)
	private int loanseq;
	private int listseq;
	private String borrower;
	private String borrowerid;
	private String borrowertel;
	private String prodname;
	private int status;
	private Date createTime;
	public int getLoanseq() {
		return loanseq;
	}
	public void setLoanseq(int loanseq) {
		this.loanseq = loanseq;
	}
	public int getListseq() {
		return listseq;
	}
	public void setListseq(int listseq) {
		this.listseq = listseq;
	}
	public String getBorrower() {
		return borrower;
	}
	public void setBorrower(String borrower) {
		this.borrower = borrower;
	}
	public String getBorrowerid() {
		return borrowerid;
	}
	public void setBorrowerid(String borrowerid) {
		this.borrowerid = borrowerid;
	}
	public String getBorrowertel() {
		return borrowertel;
	}
	public void setBorrowertel(String borrowertel) {
		this.borrowertel = borrowertel;
	}
	public String getProdname() {
		return prodname;
	}
	public void setProdname(String prodname) {
		this.prodname = prodname;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Loanreq [loanseq=" + loanseq + ", listseq=" + listseq
				+ ", borrower=" + borrower + ", borrowerid=" + borrowerid
				+ ", borrowertel=" + borrowertel + ", prodname=" + prodname
				+ ", status=" + status + ", createtime=" + createTime + "]";
	}
	
}
