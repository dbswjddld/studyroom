package co.yedam.studyroom.dto;

public class StudyroomDto {
	private String rname; // 방 이름
	private String rinfo; // 상세정보
	private int rnum; // 방 코드
	
	public StudyroomDto() {}

	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRinfo() {
		return rinfo;
	}
	public void setRinfo(String rinfo) {
		this.rinfo = rinfo;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
}
