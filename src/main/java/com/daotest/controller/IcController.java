package com.daotest.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin") // RequestMapping이 클래스 위에오면 클래스 자체가 실행됨
public class IcController {
//로그인 후 제일 처음 뜨는 페이지
	@PostMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/showMessage");
		return mv;
	}

	

}
