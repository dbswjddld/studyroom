package co.yedam.studyroom.dto;

import java.sql.Date;
import java.sql.Time;

public class ReservationDto {
	private String rname; // 방 이름
	private String id; // 예약한사람 아이드
	private Date usedate; // 이용할 날짜
	private Time starttime; // 이용 시작 시간
	private Time endtime;
	private int rno; // 예약 번호
	private String status; // 예약상태 (취소 0, 완료 1, 대기 null)
	private Date reqdate; // 신청한 날짜
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

	public Date getUsedate() {
		return usedate;
	}

	public void setUsedate(Date date) {
		this.usedate = date;
	}

	public Time getStarttime() {
		return starttime;
	}

	public void setStarttime(Time starttime) {
		this.starttime = starttime;
	}

	public Time getEndtime() {
		return endtime;
	}

	public void setEndtime(Time endtime) {
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

	public Date getReqdate() {
		return reqdate;
	}

	public void setReqdate(Date reqdate) {
		this.reqdate = reqdate;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
}
