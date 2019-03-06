package com.daotest.web;

import java.io.PrintWriter;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.daotest.dao.Dao;

/* 공통기능구현 클래스 : */
public class Ic implements HandlerInterceptor {
	
	@Autowired
	Dao dao;

	@Override // 특정 범위의 패키지에 있는 메서드가 실행되기 전에 실행될 공통 메서드
	public boolean preHandle(HttpServletRequest r, HttpServletResponse res, Object o) throws Exception {
		
		
		String id = r.getParameter("s_id");
		String pw = r.getParameter("s_pw");
		String name = r.getParameter("s_name");
		String age = r.getParameter("s_age");
		String email = r.getParameter("s_email");
		String admin = "관리자";
		
		for (int i = 0; i<dao.select().size();i++) {
			if(id.equals(dao.select().get(i).get("S_ID"))) {
				if(pw.equals(dao.select().get(i).get("S_PW"))){
					HttpSession session =  r.getSession(); //세션불러오기
					session.setAttribute("loginUser",id);
					session.setAttribute("loginPW",pw);
					session.setAttribute("loginName",dao.select().get(i).get("S_NAME"));
					session.setAttribute("loginAge",dao.select().get(i).get("S_AGE"));
					session.setAttribute("loginEmail",dao.select().get(i).get("S_EMAIL"));
					if(id.equals("admin")) {
						session.setAttribute("loginAdmin", admin);
						session.setAttribute("productlist", null);
						return true;
						
					}
					return true;
				} else {
					res.setContentType("text/html; charset=utf-8");
					PrintWriter out = res.getWriter();
					out.println("<script>");
					out.println("alert('패스워드 오류')");
					out.println("history.back()");
					out.println("</script>");
					out.close();
					
				}
			}else {
			System.out.println("아이디 검색");
			}
		
		} 		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('아이디 오류')");
		out.println("history.back()");
		out.println("</script>");
		out.close();
		return false;
		}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle 성공!");

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}
	}