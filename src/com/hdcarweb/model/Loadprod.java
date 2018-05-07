package com.hdcarweb.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="loanProd")
public class Loadprod {
	private String prodname;
	private int downpay;
	private int periodno;
	private double interest;
	private String method;
	@Id
	@Column(name = "prodname", nullable = false)
	public String getProdname() {
		return prodname;
	}
	public void setProdname(String prodname) {
		this.prodname = prodname;
	}
	public int getDownpay() {
		return downpay;
	}
	public void setDownpay(int downpay) {
		this.downpay = downpay;
	}
	public int getPeriodno() {
		return periodno;
	}
	public void setPeriodno(int periodno) {
		this.periodno = periodno;
	}
	public double getInterest() {
		return interest;
	}
	public void setInterest(double interest) {
		this.interest = interest;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	@Override
	public String toString() {
		return "Loadprod [prodname=" + prodname + ", downpay=" + downpay
				+ ", periodno=" + periodno + ", interest=" + interest
				+ ", method=" + method + "]";
	}
	
}
