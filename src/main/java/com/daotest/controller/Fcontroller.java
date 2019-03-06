package com.daotest.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.daotest.service.Daoservice;
import com.daotest.service.FService;

//Daotest - File controller
@Controller
@RequestMapping(value = "/files")
public class Fcontroller {
	// 변수
	@Autowired
	FService fs;
	
	@Autowired
	Daoservice ds;

	@Resource
	private String upath;

	@GetMapping("/daoup")
	public String upForm() {
		return "/files/daoup";
	}
	
	//장바구니 전체주문
	@RequestMapping(value="/checkOut", method=RequestMethod.POST)
	public ModelAndView check(@RequestParam HashMap<String,String> map,
			HttpServletRequest request) {
	ModelAndView mv = new ModelAndView();
	mv.setViewName("/files/checkOut");
	return mv;
	}
	
	//장바구니 전체삭제
	@RequestMapping(value = "/dCheckOut", method = RequestMethod.GET)
	public String memuRemove(HashMap<String,String> map, HttpServletRequest request) {
	        ds.deleteWish(map,request);
	        HttpSession session = request.getSession();
	        session.removeAttribute("productlist");
	        return "/files/add";
	}
	//장바구니 부분삭제
		@RequestMapping(value = "/dCheckOut2", method = RequestMethod.GET)
		public String memuRemove2(@RequestParam String proId,HashMap<String,String> map, HttpServletRequest request) {
		        String item = request.getParameter(proId);
		        ds.deleteWish(map,request);
		        HttpSession session = request.getSession();
		        session.removeAttribute("productlist");
		        return "/files/add";
		}
	
	//장바구니 상품담기
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public ModelAndView add(@RequestParam HashMap<String,String> map,
			HttpServletRequest request) {
	ds.insertWish(map, request);
	ModelAndView mv = new ModelAndView();
	mv.setViewName("/files/add");
	return mv;
	}
	
	//주문하기
	@GetMapping("/add")
	public String add() {
		return "/files/add";		
	}

	//관리자 (FAQ 글 등록 POST)
	@RequestMapping(value="/faq", method=RequestMethod.POST)
	public ModelAndView faq(@RequestParam Map<String,String> fq) {
		ds.insertFaq(fq); //질문 등록
		String t = null;
		for(HashMap<String, String> m : ds.searchFaq(fq)) {
			t = m.get("F_NUM"); //질문글의 넘버를 가져옴
		}
		ds.insertReply(t, fq); //같은 넘버로 답변 등록
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/files/faq");
		System.out.println("자주묻는질문 post");
		return mv;
		}
	
	//FAQ글 목록 보기	
		@GetMapping("/faq")
		public ModelAndView faq2(@RequestParam Map<String,String> fq) {
			ModelAndView mv = new ModelAndView();
			mv.addObject("page", ds.paging(fq));
			mv.addObject("faq", ds.qselect(fq));
			mv.setViewName("/files/faq");
			System.out.println("자주묻는질문 get");
			return mv;
			}
	

	//관리자(FAQ 글 등록 GET)
	@GetMapping("/faqup")
	public ModelAndView faqup(@RequestParam Map<String,String> fq) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("faq",ds.qselect(fq));
		mv.setViewName("/files/faqup");
		System.out.println("자주묻는질문 등록");
		return mv;
		}	

		
	// 관리자 페이지 메뉴 업로드
	@PostMapping("/upproc")
	public ModelAndView upload(@RequestParam Map<String, String> m,
			@RequestParam("i_pic") MultipartFile f) {
		ModelAndView mv = new ModelAndView();
		fs.imgInsert(m, f);
		mv.addObject("list", fs.imgselect());
		mv.setViewName("/files/addMenuList");
		return mv;
	}
	// 관리자 페이지 메뉴 보기
	@GetMapping("/upproc")
	public String imgselect(Model m) {
		m.addAttribute("list", fs.imgselect());
		return "/files/addMenuList";
		}
	
	/*/ 비회원 페이지 파일 업로드
	@PostMapping("/upproc2")
	public String upload(@RequestParam Map<String, String> m,
	@RequestParam("i_pic") MultipartFile f,Model model) {
	fs.imgInsert(m, f);
	model.addAttribute("list", fs.imgselect());
	System.out.println(fs.imgselect());
	return "/files/menu";
		}*/
	@GetMapping("/upproc2")
	public String imgselect2(Model m) {
	m.addAttribute("list", fs.imgselect());
	return "/files/menu";
		}//
		
	//상세분류 - 에스프레소
	@GetMapping("/espresso")
	public String imgselect3(Model m) {
	m.addAttribute("list", fs.imgselect());
	return "/files/espresso";
	}
		
	//상세분류 - 콜드
	@GetMapping("/cold")
	public String imgselect4(Model m) {
	m.addAttribute("list", fs.imgselect());
	return "/files/cold";
	}
		
	//상세분류 - 블렌디드
	@GetMapping("/blended")
	public String imgselect5(Model m) {
	m.addAttribute("list", fs.imgselect());
	return "/files/blended";
	}
		
	//상세분류 - 기타
	@GetMapping("/others")
	public String imgselect6(Model m) {
	m.addAttribute("list", fs.imgselect());
	return "/files/others";
	}
	

	// 다운로드서비스
	@GetMapping("/down")
	public HttpEntity<byte[]> down(@RequestParam(value = "fn") String fn) {
	// 파일열기
	File f = new File(upath, fn); // 경로,파일이름
	// 파일의 바이트배열화
	try {
	byte[] f_list = Files.readAllBytes(f.toPath());
	// response 정리
	HttpHeaders h = new HttpHeaders();
	h.setContentType(MediaType.TEXT_PLAIN);
	h.set(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fn.replace(" ", "_"));
	h.setContentLength(f_list.length);
	// return
	return new HttpEntity<byte[]>(f_list, h);
	} catch (IOException e) {
	e.printStackTrace();
	}

		return null;
	}
	/*
	// 고객 페이지 파일 업로드
	@PostMapping("/upproc2")
	public String upload(@RequestParam Map<String, String> m,
			@RequestParam("i_pic") MultipartFile f,Model model) {
		fs.imgInsert(m, f);
		model.addAttribute("list", fs.imgselect());
		System.out.println(fs.imgselect());
		return "/files/addMenuList";
	}
*/

	/* 파일업로드
	@PostMapping("/upproc")
	public String upProc(@RequestParam HashMap<String, String> test, Model m) {
		m.addAttribute("finfo", fs.imginsert(f, t));
		m.addAttribute("list", fs.imgselect());
		 리턴
		return "/files/menu";
	}


	@GetMapping("/upproc")
	public String imgselect(Model m) {
		m.addAttribute("list", fs.imgselect());
		return "/files/addMenuList";
	}*/
	// <Request Mapping 방법>
	// @RequestMapping(value="/upproc", method=RequestMethod.POST)
	// public String upProc(@RequestParam("file") MultipartFile f,
	// @RequestParam("title") String title, Model m) {
	// 실행정보 출력
	// System.out.printf("파일: %s, 제목: %s \n",f.getOriginalFilename(), title);
	// 파일 업로드
	// m.addAttribute("finfo",fs.upload(f).put("title", title));
	// 리턴
	// return "/files/up";
	// }
}
