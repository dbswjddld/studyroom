package co.yedam.studyroom.dto;

public class RoomfileDto {
	private int rnum; // 방 코드
	private String filepath; // 파일 경로
	
	public RoomfileDto() {}

	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
}
