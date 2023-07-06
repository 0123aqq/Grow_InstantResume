package com.instantresume;

import java.util.ArrayList;
import java.util.List;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;


@WebFilter("/*")
public class CommonFilter implements Filter {
	ServletContext context;

	public void init (FilterConfig fConfig) throws ServletException{
		System.out.println("UTF-8 Encoding");
		context = fConfig.getServletContext();
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
			throws IOException, ServletException {
		System.out.println("----------------doFilter Calling------------------");
		
		String context = ((HttpServletRequest)request).getContextPath();
		String pathinfo = ((HttpServletRequest)request).getRequestURI();
		
		String msg = "Context Information: " + context 
				+ "\nURI Information: " + pathinfo;
		System.out.println(msg);
				
		String[] pathSplits = pathinfo.split("\\.");
		List<String> exceptionFormat = new ArrayList<>();
		exceptionFormat.add("html");
		exceptionFormat.add("css");
		exceptionFormat.add("svg");
		exceptionFormat.add("ico");
		exceptionFormat.add("png");
		exceptionFormat.add("bmp");
		exceptionFormat.add("jpg");
		exceptionFormat.add("jpge");
		

		if (!exceptionFormat.contains(pathSplits[pathSplits.length - 1]) && !pathinfo.equals("/")) {
//			System.out.println("Filter applied\n");
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=utf-8");
		} else {
//			System.out.println("Filter not applied\n");
		}
		
		chain.doFilter(request, response);
	}
	
	public void destroy() {
		System.out.println("destroy calling");
	}

}
