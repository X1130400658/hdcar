package com.hdcarweb.filter;

public class THreadLocalUtil {
	
	private static ThreadLocal<Integer> pageSize = new ThreadLocal<Integer>();
	private static ThreadLocal<Integer> pageOffset = new ThreadLocal<Integer>();
	
	public static Integer getPageSize() {
		return pageSize.get();
	}
	public static void setPageSize(Integer pageSize) {
		THreadLocalUtil.pageSize.set(pageSize);;
	}
	
	public static void removePageSize(){
		THreadLocalUtil.pageSize.remove();
	}
	
	public static Integer getPageOffset() {
		return pageOffset.get();
	}
	public static void setPageOffset(Integer pageOffset) {
		THreadLocalUtil.pageOffset.set(pageOffset);
	}
	
	public static void removePageOffset(){
		THreadLocalUtil.pageOffset.remove();
	}
	


}
