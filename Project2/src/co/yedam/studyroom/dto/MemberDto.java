package co.yedam.studyroom.dto;

public class MemberDto {
	private String id;
	private String pw;
	private String email;
	private String tel;
	private String grant; // 등급 관리자(A) 일반회원(U) 탈퇴회원(X)
	private String emailres; // 이메일 수신 체크여부  동의(Y) 동의안함(N)
	
	public MemberDto(){}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGrant() {
		return grant;
	}

	public void setGrant(String grant) {
		this.grant = grant;
	}

	public String getEmailres() {
		return emailres;
	}

	public void setEmailres(String emailres) {
		this.emailres = emailres;
	}
	
	
}
