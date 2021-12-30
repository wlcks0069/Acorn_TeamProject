package pack.pp_model;

public class PPDto {
	private int pp_no,pp_likecount,pp_commentcount;
	private String mem_nick,mem_email,pp_colorlike,pp_brightnesslike;

	/*
		테이블 요소
		
		create table privatepage
		(pp_no number(10) primary key,		pp_no				: 개인페이지 번호
		mem_nick varchar2(20),				mem_nick			: 닉네임 - 페이지 내 표기
		mem_email varchar2(50),				mem_email			: 이메일 - 유저 고유값으로, 구분에 사용
		pp_colorlike varchar2(20),			pp_colorlike		: 좋아요한 색 모음
		pp_brightnesslike number(5),		pp_brightnesslike	: 좋아요한 채도 모음
		pp_likecount number(10),			pp_likecount		: 총 좋아요 수
		pp_commentcount number(10));		pp_commentcount		: 총 댓글 수
	 
	 */
		
	public int getPp_no() {
		return pp_no;
	}
	public void setPp_no(int pp_no) {
		this.pp_no = pp_no;
	}
	public int getPp_likecount() {
		return pp_likecount;
	}
	public void setPp_likecount(int pp_likecount) {
		this.pp_likecount = pp_likecount;
	}
	public int getPp_commentcount() {
		return pp_commentcount;
	}
	public void setPp_commentcount(int pp_commentcount) {
		this.pp_commentcount = pp_commentcount;
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
	public String getPp_colorlike() {
		return pp_colorlike;
	}
	public void setPp_colorlike(String pp_colorlike) {
		this.pp_colorlike = pp_colorlike;
	}
	public String getPp_brightnesslike() {
		return pp_brightnesslike;
	}
	public void setPp_brightnesslike(String pp_brightnesslike) {
		this.pp_brightnesslike = pp_brightnesslike;
	}
}
