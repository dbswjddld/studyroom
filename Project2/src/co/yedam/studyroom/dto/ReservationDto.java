package co.yedam.studyroom.dto;

public class ReservationDto {
	private String rname; // 방 이름
	private String id; // 예약한사람 아이드
	private String usedate; // 이용할 날짜
	private String starttime; // 이용 시작 시간
	private String endtime;
	private int rno; // 예약 번호
	private String status; // 예약상태 (예약완료, 예약취소, 이용완료)
	private String reqdate; // 신청한 날짜
	private int rnum; // 방 코드
	
	public ReservationDto() {}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsedate() {
		return usedate;
	}

	public void setUsedate(String date) {
		this.usedate = date;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReqdate() {
		return reqdate;
	}

	public void setReqdate(String reqdate) {
		this.reqdate = reqdate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
}
