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

}
