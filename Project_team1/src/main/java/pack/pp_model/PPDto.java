package pack.pp_model;

public class PPDto {
	private int pp_no;
	private String mem_nick,mem_email;
	
	/*
		테이블 요소
		
		create table privatepage
		(pp_no number(10) primary key,		pp_no				: 개인페이지 번호
		mem_nick varchar2(20),				mem_nick			: 닉네임 - 페이지 내 표기
		mem_email varchar2(50));			mem_email			: 이메일 - 유저 고유값으로, 구분에 사용

	 
	 */
		
	public int getPp_no() {
		return pp_no;
	}
	public void setPp_no(int pp_no) {
		this.pp_no = pp_no;
	}
	public String getMem_nick() {
		return mem_nick;
	}
	public void setMem_nick(String mem_nick) {
		this.mem_nick = mem_nick;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
}
