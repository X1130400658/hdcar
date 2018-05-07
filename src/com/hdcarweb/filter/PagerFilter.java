package com.hdcarweb.filter;

import javax.servlet.*;
import java.io.IOException;

public class PagerFilter implements Filter {

	private int pagerSize;
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		try {
			int pageOffset = 0;
			String offset = req.getParameter("pager.offset");
			try {
				pageOffset = Integer.parseInt(offset);
			} catch (NumberFormatException e) {
			}
			THreadLocalUtil.setPageOffset(pageOffset);
			THreadLocalUtil.setPageSize(pagerSize);
			chain.doFilter(req, resp);
		} finally{
			THreadLocalUtil.removePageSize();
			THreadLocalUtil.removePageOffset();
		}
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		String pS = config.getInitParameter("pageSize");
		try {
			pagerSize = Integer.parseInt(pS);
		} catch (NumberFormatException e) {
			pagerSize = 15;
		}
		
		
	}



}
