package com.daotest.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daotest.dao.Dao;

@Service
public class Daoservice {
	// dao 가져오기
	@Autowired
	Dao dao;

	// insert
	public void insert(Map<String, String> d) {
		dao.insert(d);
	}

	// select
	public ArrayList<HashMap<String, String>> select() {
		return dao.select();
	}

	// menu search
	public ArrayList<HashMap<String, String>> search(String a) {
		return dao.search(a);
	}
	
	// faq search
	public ArrayList<HashMap<String, String>> bsearch(String a) {
		return dao.bsearch(a);
		}
	
	// content
	public ArrayList<HashMap<String,String>> content(){
		return dao.content();
	}
	
	// 메뉴 상세보기
	public ArrayList<HashMap<String, String>> view(int gdsnum) {
		return dao.view(gdsnum);
	}
	// 회원정보
	public ArrayList<HashMap<String,String>> mypage(int s_num) {
		return dao.mypage(s_num);
		}
	// FAQ 질문 등록
	public void insertFaq(Map<String, String> fq){
		dao.insertFaq(fq);
	}
	
	// FAQ 검색
	public ArrayList<HashMap<String,String>> searchFaq(Map<String, String> fq){
		return dao.searchFaq(fq);
	}
	
	// FAQ 댓글 등록
	public void insertReply(String t, Map<String, String> fq){
		dao.insertReply(t, fq);
	}
	// FAQ 보기
	public ArrayList<HashMap<String,String>> qselect(Map<String, String> m) {
	      String pgnum = m.get("pg");
	      String bEanum = m.get("bEa");
	      if (bEanum == "" || Objects.isNull(bEanum)) {
	         bEanum = "6";
	       
	      } else {
	         bEanum = m.get("bEa");
	      }
	      if (pgnum == "" || Objects.isNull(pgnum)) {
	         pgnum = "1";
	      } else {   
	         pgnum = m.get("pg");
	      }
		return dao.qselect(pgnum, bEanum);
	}
	
	// 페이징 정보
	   public HashMap<String, String> paging(Map<String, String> map) {
		      String pgnum = map.get("pg");
		      String bEanum = map.get("bEa");
		      
		      if(bEanum == "" || Objects.isNull(bEanum)) {
		         bEanum = "6";
		      } else {
		         bEanum = map.get("bEa");
		      }
		      
		      if(pgnum == "" || Objects.isNull(pgnum)) {
		         pgnum = "1";   
		      } else {
		         pgnum = map.get("pg");
		      }
		      
		      HashMap<String, String> page = dao.page();
		      String entbcnt = page.get("CT");
		      String lstbnum = page.get("CP");
		      int pgN = Integer.parseInt(pgnum);
		      
		      int stn = ((pgN-1)/10)*10 + 1;
		      int endn = stn + 10 - 1;
		      
		      HashMap<String, String> paging = new HashMap<String, String>();
		      
		      paging.put("pg", pgnum);
		      paging.put("bEa", bEanum);
		      paging.put("stn", Integer.toString(stn));
		      paging.put("endn", Integer.toString(endn));
		      paging.put("entbcnt", entbcnt);
		      paging.put("lstbnum", lstbnum);
		      
		      return paging; 
		   }
	
	// 최종주문 입력
	public void insertOrder(Map<String, String> c) {
		dao.insertOrder(c);
	}
	
	// 회원(최종주문 POST 출력)
	public ArrayList<HashMap<String, String>> vorder(Map<String, String> map) {
		return dao.vorder(map);
		
	}
	// 회원(최종주문 GET 출력)
	public ArrayList<HashMap<String, String>> vorder2(String m) {
		return dao.vorder2(m);
	}
	
	// 관리자(최종주문 출력)
	public ArrayList<HashMap<String, String>> vallorder(Map<String, String> map) {
		return dao.vallorder(map);
			}
	
	
	// 장바구니 삭제
	public void deleteWish(HashMap<String,String> map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String proId = request.getParameter("productId");
		String proImg = request.getParameter("productImg");
		String amount = request.getParameter("amount");
		String price = request.getParameter("price");
		String state = request.getParameter("state");
		
		map = new HashMap<String, String>();
		map.put("productId", proId);
		map.put("productImg",proImg);
		map.put("amount", amount);
		map.put("price",price);
		map.put("state",state); 

		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		ArrayList<Map<String, String>> lists = (ArrayList<Map<String, String>>) session.getAttribute("productlist");

		if (lists==null) {
			list.add(map);
			session.setAttribute("productlist", list);
		} else {
			lists.add(map);
			session.setAttribute("productlist", lists);
		}
	}
          
     
	// 장바구니
	public void insertWish(HashMap<String,String> map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String proId = request.getParameter("productId");
		String proImg = request.getParameter("productImg");
		String amount = request.getParameter("amount");
		String price = request.getParameter("price");
		String state = request.getParameter("state");
		
		map = new HashMap<String, String>();
		map.put("productId", proId);
		map.put("productImg",proImg);
		map.put("amount", amount);
		map.put("price",price);
		map.put("state",state);
		
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		ArrayList<Map<String, String>> lists = (ArrayList<Map<String, String>>) session.getAttribute("productlist");

		if (lists==null) {
			list.add(map);
			session.setAttribute("productlist", list);
		} else {
			lists.add(map);
			session.setAttribute("productlist", lists);
		}
	}
	//배송상태 업데이트
	public boolean update_state (String f_no,String f_state) {
		return dao.dchange(cs(f_no),cs(f_state));
		
	}
	//기본 문자열을 문자 배열로 만들어주는 메서드
	public String[] cs (String str) {
		String[] array = str.split(",");
		return array;
	}
	
}
