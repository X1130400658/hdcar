package com.hdcarweb.model;

import java.util.List;

public class Pager<T> {
	
	private int pageSize;
	private int pageOffset;
	private long pageCount;
	private List<T> objs;
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageOffset() {
		return pageOffset;
	}
	public void setPageOffset(int pageOffset) {
		this.pageOffset = pageOffset;
	}
	public long getPageCount() {
		return pageCount;
	}
	public void setPageCount(long pageCount) {
		this.pageCount = pageCount;
	}
	public List<T> getObjs() {
		return objs;
	}
	public void setObjs(List<T> objs) {
		this.objs = objs;
	}
	@Override
	public String toString() {
		return "Pager [pageSize=" + pageSize + ", pageOffset=" + pageOffset
				+ ", pageCount=" + pageCount + ", objs=" + objs + "]";
	}
	
	
	
}
