package pack.cm_model;

public class CMBoardDto {
	
	/*
		create table commentdb
		(cm_no number(10) primary key,				cm_no				: 댓글 고유번호
		mc_no number(10),							mc_no				: 댓글의 원글 번호
		mem_nick varchar2(20),						mem_nick			: 작성자 닉네임
		mem_email varchar2(50),						mem_email			: 작성자 이메일
		cm_commentcontent varchar2(450) not null,	cm_commentcontent	: 댓글 내용
		cm_date date);								cm_date				: 댓글 작성을
	*/
	
	private int cm_no, mc_no;
	private String mem_nick, mem_email, cm_commentcontent, cm_date;
	
	public int getCm_no() {
		return cm_no;
	}
	public void setCm_no(int cm_no) {
		this.cm_no = cm_no;
	}
	public int getMc_no() {
		return mc_no;
	}
	public void setMc_no(int mc_no) {
		this.mc_no = mc_no;
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
	public String getCm_commentcontent() {
		return cm_commentcontent;
	}
	public void setCm_commentcontent(String cm_commentcontent) {
		this.cm_commentcontent = cm_commentcontent;
	}
	public String getCm_date() {
		return cm_date;
	}
	public void setCm_date(String cm_date) {
		this.cm_date = cm_date;
	}
	
}
