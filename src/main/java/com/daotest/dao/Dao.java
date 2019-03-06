package com.daotest.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import commons.Db;

@Component //dao는 service에 주입됨
public class Dao {
	// content 상세보기
	public ArrayList<HashMap<String,String>> content() {
		return Db.selectListMap("SELECT * FROM tbl_goods");
		
	}
	// menu search
	public ArrayList<HashMap<String,String>> search(String a) {
		String sql = String.format("SELECT * FROM tbl_goods where gdsName like '%%%s%%'", a);
		return Db.selectListMap(sql);
	}
	
	// board search
	public ArrayList<HashMap<String,String>> bsearch(String a) {
	String sql = String.format("SELECT * FROM BOARD1_TBL WHERE F_TITLE LIKE '%%%s%%'", a);
	return Db.selectListMap(sql);
		}
	// insert
	public void insert(Map<String, String> d) {
		String sql = String.format("INSERT INTO spr_test2 VALUES (SQ_spr_test2.NEXTVAL,'%s','%s','%s',%s,'%s')", d.get("s_id"),d.get("s_pw"),d.get("s_name"),d.get("s_age"),d.get("s_email"));
		Db.executeUpdate(sql);
	}

	// select
	public ArrayList<HashMap<String,String>> select() {
		return Db.selectListMap("SELECT * FROM spr_test2");
	}
	
	// images insert
	public void imgInsert(Map<String, String> dd) {
		String sql= String.format("INSERT INTO tbl_goods VALUES (seq_tbl_goods.NEXTVAL, '%s', '%s','%s','%s',%s, %s, %s, %s, %s,'%s')",
				dd.get("i_title"), dd.get("gdsEname"), dd.get("cateCode"),
				dd.get("gdsDes"), dd.get("gdsprice"),dd.get("gdskcal"), dd.get("gdscaffein"),
				dd.get("gdsfat"), dd.get("gdssugar"), dd.get("i_pic"));
		Db.executeUpdate(sql);
	}
	
	// image select
	public ArrayList<HashMap<String,String>> imgselect() {
		return Db.selectListMap("SELECT * FROM tbl_goods ORDER BY GDSNUM ASC");
	}
	
	//이미지 상세보기
	public ArrayList<HashMap<String, String>> view(int gdsnum) {
		String sql= String.format("SELECT * FROM tbl_goods where gdsnum = %s", gdsnum);
				return Db.selectListMap(sql);
	}
	//회원 상세보기
	public ArrayList<HashMap<String, String>> mypage(int s_num) {
		String sql=String.format("SELECT * FROM spr_test2 where s_num = %s", s_num);
						return Db.selectListMap(sql);
	}
	
	//FAQ 질문등록
	public void insertFaq(Map<String, String> fq){
	String sql = String.format("INSERT INTO BOARD1_TBL(f_num,f_cate,f_title) VALUES (SEQ_BOARD1_TBL.NEXTVAL,'%s','%s')",
		fq.get("f_cate"),fq.get("f_title"));
		Db.executeUpdate(sql);
	}
	
	//FAQ 질문선택
	public ArrayList<HashMap<String, String>> searchFaq(Map<String, String> fq){
	String sql = String.format("SELECT * FROM BOARD1_TBL where f_cate = '%s' AND f_title = '%s'",
		fq.get("f_cate"),fq.get("f_title"));
	return Db.selectListMap(sql);
	}
	
	//FAQ 댓글등록
	public void insertReply(String t, Map<String,String>b) {
		String sql = String.format("P_REPLY ('%s','%s','%s')", t, b.get("f_cate1"), b.get("f_title1"));
		System.out.println(sql);
      Db.excuteUpdate_fun(sql);
      }
	
	//FAQ 보기
	public ArrayList<HashMap<String,String>> qselect(String pg, String bEa) {
		String sql = String.format("SELECT * FROM V_BOARD1_TBL WHERE F_PAGE (R, %s, %s)=1", pg, bEa);
		return Db.selectListMap(sql);
	}
	
	//page
	public HashMap<String,String> page() {
		return Db.selectMap("SELECT COUNT(*) ct, CEIL(COUNT(*)/5) cp FROM V_BOARD1_TBL");
	}

	//최종 주문
	public void insertOrder(Map<String, String> c) {
		String sql = String.format("INSERT INTO f_order VALUES (seq_f_order.NEXTVAL,'%s','%s','%s','%s','%s','%s','%s','%s','%s',%s,%s,%s,DEFAULT,DEFAULT)",
		c.get("f_name"),c.get("f_email"),c.get("f_address"),c.get("f_city"),c.get("f_ctype"),c.get("f_number"),c.get("f_exp"),c.get("f_id"),c.get("f_menu"),c.get("f_quantity"),c.get("f_price"),c.get("f_total"),c.get("f_state"),c.get("f_pronum"));
		Db.executeUpdate(sql);
	}
	
	// 회원(최종 주문내역 POST 출력)
	public ArrayList<HashMap<String, String>> vorder(Map<String, String> m) {
		String sql = String.format("select f_no, f_name, f_email, f_address, f_city, f_ctype, f_number, f_exp, f_id, f_menu,f_quantity, f_price, f_total, f_state,TO_CHAR(SYSDATE, 'YYYYMMDD') || dbms_random.string('x',5) AS f_pronum from f_order where f_id ='%s' ORDER BY f_no DESC"
				, m.get("f_id"));
		return Db.selectListMap(sql);
	}
	// 회원(최종 주문내역 GET 출력)
	public ArrayList<HashMap<String, String>> vorder2(String m) {
		String sql = String.format("select f_no, f_name, f_email, f_address, f_city, f_ctype, f_number, f_exp, f_id, f_menu,f_quantity, f_price, f_total, f_state,TO_CHAR(SYSDATE, 'YYYYMMDD') || dbms_random.string('x',5) AS f_pronum from f_order where f_id ='%s' ORDER BY f_no DESC",m);
		return Db.selectListMap(sql);
	}
	
	// 관리자(모든 주문내역 출력)
	public ArrayList<HashMap<String, String>> vallorder(Map<String, String> m) {
		String sql = String.format("select * from f_order ORDER BY f_id DESC");
		return Db.selectListMap(sql);
	}
	
	// 관리자 배송상태 수정
	public boolean dchange(String f_no[],String f_state[]) {
	boolean result = false;
	for(int i=0;i<f_no.length;i++) {
	String sql= String.format("UPDATE f_order SET f_state = '%s' where f_no = %s",f_state[i],f_no[i]);
	if(Db.executeUpdate(sql)==0) {
	result=false;
	}
	result=true;
	}
	return result;
	} }
