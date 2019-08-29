package co.yedam.studyroom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yedam.studyroom.common.DAO;
import co.yedam.studyroom.dto.StudyroomDto;

public class StudyroomDao {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private StudyroomDto dto;

//	생성자
	public StudyroomDao() {
		conn = DAO.conn();
	}

//	DB 닫는 메소드
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	///////////////////////////////////////////////////////////
	
	// [윤정 0823] '예약하기' 페이지에서 방 정보 보여주기
	public ArrayList<StudyroomDto> search() {
		ArrayList<StudyroomDto> list = new ArrayList<StudyroomDto>();
		String sql = "SELECT * FROM studyroom";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new StudyroomDto();
				dto.setRname(rs.getString("rname"));
				dto.setRnum(rs.getInt("rnum"));
				dto.setRinfo(rs.getString("rinfo"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//0829  스터디룸 리스트 가져옴 곽동우
	//위에꺼씀
	
	//스터디룸 입력 0829 곽동우
	public int insertRoom(StudyroomDto dto) {
		int n = 0;
		String sql = "insert into studyroom values(?, ?, (select max(rnum)+1 as rnum from studyroom))";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getRname());
			psmt.setString(2, dto.getRinfo());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DAO.close(conn, psmt, rs);
		}
		return n;
	}
	
	
}
