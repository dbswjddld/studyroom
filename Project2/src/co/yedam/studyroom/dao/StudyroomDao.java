package co.yedam.studyroom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

}
