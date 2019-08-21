package co.yedam.studyroom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import co.yedam.studyroom.common.DAO;
import co.yedam.studyroom.dto.MemberDto;

public class MemberDao {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private MemberDto dto;

//	생성자
	public MemberDao() {
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
	
	//로그인
	public MemberDto login(MemberDto dto) {
		MemberDto output = null;
		String sql = "SELECT id, mgrant FROM member WHERE id = ? AND pw = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			rs = psmt.executeQuery();
			if(rs.next()) {
				output = new MemberDto();
				output.setId(rs.getString("id"));
				output.setGrant(rs.getString("mgrant"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return output;
	}

	//회원가입
	public int insert(MemberDto dto) {
		int n = 0;
		String sql = "INSERT INTO member(id, pw, email, tel, mgrant, emailres) VALUES (? ,? ,? ,? ,? ,?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getEmail());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, "U");
			psmt.setString(6, "Y");
			n = psmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return n;
	}
	
	//ID 중복확인
	public String idCheck(String input) {
		String result = null;
		String sql = "SELECT id FROM member WHERE id =?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, input);
			rs = psmt.executeQuery();
			if(rs.next()) //해당 id가 이미 있으면 1
				result = rs.getString(1);
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close();
		}
		return result;
		
	}
}
