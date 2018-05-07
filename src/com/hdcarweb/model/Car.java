package com.hdcarweb.model;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity // 注解为hibernate实体
@Table(name="listing") // 注解对应的表�?

public class Car {
	@Id
	@GeneratedValue // id生成策略  默认auto 相当于hibernate的native - 自增字段
	@Column(name = "listseq", nullable = false)
	private int listseq;
	private String enginesize;
	private String emission;
	private String seatno;
	private String brand;
	private String model;
	private String modelnote;
	private String user;
	private String sellertel;
	private Date regdate;
	private String mileage;
	private String location;
	private String color;
	private int price;
	private String vin;
	private String sunroof;
	private Date buydate;
	private int tradeno;
	private Date motexp;
	private Date insureexp;
	private int accidentno;
	private String repairdes;
	private String fine;
	private String refitdes;
	private String city;
	private String type;
	private String regsite;
	private String note;
	private int status;
	private int picsno;

	@Column(name = "createtime")
	private Date createTime;
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public int getListseq() {
		return listseq;
	}
	public void setListseq(int listseq) {
		this.listseq = listseq;
	}
	public String getModelnote() {
		return modelnote;
	}
	public void setModelnote(String modelnote) {
		this.modelnote = modelnote;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getSellertel() {
		return sellertel;
	}
	public void setSellertel(String sellertel) {
		this.sellertel = sellertel;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getVin() {
		return vin;
	}
	public void setVin(String vin) {
		this.vin = vin;
	}
	public String getSunroof() {
		return sunroof;
	}
	public void setSunroof(String sunroof) {
		this.sunroof = sunroof;
	}
	public Date getBuydate() {
		return buydate;
	}
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
	public int getTradeno() {
		return tradeno;
	}
	public void setTradeno(int tradeno) {
		this.tradeno = tradeno;
	}
	public Date getMotexp() {
		return motexp;
	}
	public void setMotexp(Date motexp) {
		this.motexp = motexp;
	}
	public int getAccidentno() {
		return accidentno;
	}
	public void setAccidentno(int accidentno) {
		this.accidentno = accidentno;
	}
	public String getRepairdes() {
		return repairdes;
	}
	public void setRepairdes(String repairdes) {
		this.repairdes = repairdes;
	}
	public String getFine() {
		return fine;
	}
	public void setFine(String fine) {
		this.fine = fine;
	}
	public String getRefitdes() {
		return refitdes;
	}
	public void setRefitdes(String refitdes) {
		this.refitdes = refitdes;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Date getInsureexp() {
		return insureexp;
	}
	public void setInsureexp(Date insureexp) {
		this.insureexp = insureexp;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEnginesize() {
		return enginesize;
	}
	public void setEnginesize(String enginesize) {
		this.enginesize = enginesize;
	}
	public String getEmission() {
		return emission;
	}
	public void setEmission(String emission) {
		this.emission = emission;
	}
	public String getSeatno() {
		return seatno;
	}
	public void setSeatno(String seatno) {
		this.seatno = seatno;
	}
	public String getRegsite() {
		return regsite;
	}
	public void setRegsite(String regsite) {
		this.regsite = regsite;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPicsno() {
		return picsno;
	}
	public void setPicsno(int picsno) {
		this.picsno = picsno;
	}
	@Override
	public String toString() {
		return "Car [listseq=" + listseq + ", enginesize=" + enginesize
				+ ", emission=" + emission + ", seatno=" + seatno + ", brand="
				+ brand + ", model=" + model + ", modelnote=" + modelnote
				+ ", user=" + user + ", sellertel=" + sellertel + ", regdate="
				+ regdate + ", mileage=" + mileage + ", location=" + location
				+ ", color=" + color + ", price=" + price + ", vin=" + vin
				+ ", sunroof=" + sunroof + ", buydate=" + buydate
				+ ", tradeno=" + tradeno + ", motexp=" + motexp
				+ ", insureexp=" + insureexp + ", accidentno=" + accidentno
				+ ", repairdes=" + repairdes + ", fine=" + fine + ", refitdes="
				+ refitdes + ", city=" + city + ", type=" + type + ", regsite="
				+ regsite + ", note=" + note + ", status=" + status
				+ ", picsno=" + picsno + ", createTime=" + createTime + "]";
	}	
}
