package co.yedam.studyroom.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class BoardDto {
	private int bno;
	private String subject;
	private String content;
	private String id;
	private Timestamp bdate;
	
	public BoardDto() {}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getBdate() {
		return bdate;
	}

	public void setBdate(Timestamp bdate) {
		this.bdate = bdate;
	}
	
	
}
