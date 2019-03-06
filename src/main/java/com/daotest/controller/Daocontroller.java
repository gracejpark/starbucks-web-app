package com.daotest.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.daotest.service.Daoservice;

@Controller
public class Daocontroller {
	//service
	@Autowired
	Daoservice ds;
	
	//Get방식 요청:datotest.do, form(daotest.jsp)
	//@GetMapping : Get방식 요청만 맴핑
	//@RequestMapping : Get, Post 모든 요청 맵핑
	//@RequestMapping(value="/daotest.html", method=RequestMethod.GET)
	//		public String add() {
	//			return "daotest";
	@GetMapping("daotest.do")
	public String daotestGet() {
		return "daotest";
}
	//Post방식 요청:datotest.do, insert(daolist.jsp)
	@RequestMapping(value="daolist.do", method=RequestMethod.POST)
	public ModelAndView daotestPost(@RequestParam Map<String,String> pm) {
		ds.insert(pm);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",ds.select());
		mv.setViewName("/admin/index");
		return mv;
}
	//관리자(전체회원정보)
	@GetMapping("daolist.do")
	public ModelAndView daolistPost() {
		ModelAndView mv1 = new ModelAndView();
		mv1.addObject("list",ds.select());
		mv1.setViewName("/daolist");
		return mv1;
	}
	
	@GetMapping("/login")
	public String loginGet() {
		return "/files/mypage";
}
	@GetMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		System.out.println("로그아웃성공!");
		return "/daotest";
	}
	//메뉴검색
	@GetMapping("/menuSearch")
	public String menuSearch(String mySearch,Model m) {
		m.addAttribute("list",ds.search(mySearch));
		return "/files/addMenuList";		
	}
	
	//FAQ 게시판 검색
	@GetMapping("/boardSearch")
	public String boardSearch(String mybSearch,Model m) {
	m.addAttribute("faq",ds.bsearch(mybSearch));
	return "/files/faq";		
	}
	
	//메뉴 상세보기
	@GetMapping("/item")
	public ModelAndView view(@RequestParam("g") int gdsnum) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("view", ds.view(gdsnum));
		mv.setViewName("/files/content");
		return mv;
		}
	
	//회원(주문내역)
	@RequestMapping(value="/finished", method=RequestMethod.POST)
	public ModelAndView finished(@RequestParam HashMap<String,String> f,HttpServletRequest request) {
		ds.insertOrder(f);
		ds.insertWish(f, request);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ds.vorder(f));
		HttpSession session = request.getSession();
	    session.removeAttribute("productlist");
		mv.setViewName("/files/finished");
		return mv;
	}
	//회원(주문내역)
	@GetMapping("/finished")
	public ModelAndView finished2(HttpSession s) {
	ModelAndView mv = new ModelAndView();
	String id = String.valueOf(s.getAttribute("loginUser"));
	mv.addObject("list", ds.vorder2(id));
	mv.setViewName("/files/finished");
	return mv;
		}
	
	//관리자(전체주문내역)
	@GetMapping("/adfinished")
	public ModelAndView adfinished(@RequestParam HashMap<String,String> f,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", ds.vallorder(f));
		mv.setViewName("/admin/finished");
		return mv;
	}
	//관리자(주문내역 수정)
	@RequestMapping(value="/update.do", method=RequestMethod.POST)
	public ModelAndView update(String f_no,String f_state) {
		ModelAndView mv = new ModelAndView();
		//업데이트를 실행하고
		ds.update_state(f_no,f_state);
		//페이지로 돌아간다
		mv.setViewName("redirect:/adfinished");
		return mv;
	}
	//마지막 페이지
		@RequestMapping(value="/end", method=RequestMethod.POST)
		public String end(HashMap<String,String> map, HttpServletRequest request) {
			 ds.deleteWish(map,request);
		        HttpSession session = request.getSession();
		        session.removeAttribute("productlist");
		        return "/admin/index";
		}
	
	
	//상세보기
		/*@GetMapping("/item")
		public String item(Model m) {
			m.addAttribute("list",ds.content());
			return "/files/content";		
		}*/
	
	
	/*/주문하기
	@RequestMapping(value="goCartList", method=RequestMethod.GET)
	public String addCart(String gdsnum, Model model, HttpSession session, Product pruduct) {
int addNum = Integer.parseInt(gdsnum);
Product addCart = dao.selectProOne(addNum); //장바구니에 추가할 상품정보 가져오기

ArrayList<Product> carList = (ArrayList<Product>)session.getAttribute("cartList");
if(cartList ==null) {
	cartList = new ArrayList<>();
}
cartList.add(addCart); //carlist에 추가할 상품정보를 추가
session.setAttribute("cartList",cartList); 
return "redirect:cart";
	}*/
	
	/*/마이페이지
	@GetMapping("/mypage")
	public ModelAndView mypage(@RequestParam("m") int s_num) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/files/mypage");
		return mv;
		
	}
	*/
	
}
	

