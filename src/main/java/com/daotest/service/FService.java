package com.daotest.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.daotest.dao.Dao;


//Daotest - File Service
@Service
public class FService {
	// 변수
	@Autowired
	Dao dao;
	
	@Autowired
	String upath;

	//img select
		public ArrayList<HashMap<String, String>> imgselect(){
			return dao.imgselect();
		}
					
	// 파일업로드처리
	public Map<String,String> upload(MultipartFile f, String t) {
		// 정보출력
			System.out.printf("파일이름: %s", f.getOriginalFilename());

					// 초기
					UUID uid = UUID.randomUUID(); // 랜덤아이디 생성
					String oname = f.getOriginalFilename();
					String fname = uid.toString() + "_" + oname; // 유일한 이름
					//리턴 맵
					Map<String, String> finfos = new HashMap<String,String>(){{
						put("i_title",oname);
						put("i_pic",fname);
					}};
					// 파일처리
					File file = new File(upath, fname);
					try {
						FileCopyUtils.copy(f.getBytes(), file);
						return finfos;
					} catch (Exception e) {
						return null;
					}
				}
	
		
	// 파일등록처리
	public Map<String, String> imgInsert(Map<String, String> m, MultipartFile f) {
		// 정보출력
		System.out.printf("파일이름: %s", f.getOriginalFilename());

		// 초기
		UUID uid = UUID.randomUUID(); // 랜덤아이디 생성
		String oname = f.getOriginalFilename();
		String i_pic = uid.toString() + "_" + oname; // 유일한 이름
		// 리턴 맵
		m.put("i_pic", i_pic);
		
		dao.imgInsert(m);
		// 파일처리
		File file = new File(upath, i_pic);
		try {
			FileCopyUtils.copy(f.getBytes(), file);
			return m;
		} catch (Exception e) {
			return null;
		}
	}
}
