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
			psmt.setString(6, dto.getEmailres());
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

	public int update(MemberDto dto) { //회원정보수정
		int n = 0;
		String sql = "update member set pw = ?, email = ?, tel = ?, emailres = ? where id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getPw());
			psmt.setString(2, dto.getEmail());
			psmt.setString(3, dto.getTel());
			psmt.setString(4, dto.getEmailres());
			psmt.setString(5, dto.getId());
			n = psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	public MemberDto serach(MemberDto dto) { 
		MemberDto output = null;
		String sql = "SELECT * FROM member WHERE id = ? and pw = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			rs = psmt.executeQuery();
			if(rs.next()) {
				output = new MemberDto();
				output.setId(rs.getString("id"));
				output.setPw(rs.getString("pw"));
				output.setEmail(rs.getString("email"));
				output.setEmailres(rs.getString("emailres"));
				System.out.println("비밀번호 입력했을때 emailres : " + rs.getString("emailres"));
				output.setTel(rs.getString("tel"));
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return output;
	}
	
	public int Withdrawal(MemberDto dto) { //회원정보삭제
		int n = 0;
		String sql = "update member set mgrant = ? where id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "X");
			psmt.setString(2, dto.getId());
			n = psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return n;
	}
	
//	public int (String id) { //회원 삭제
//		int n = 0;
//		String sql = "delete from member where id = ?";
//		try {
//			psmt = conn.prepareStatement(sql);
//			psmt.setString(1, id);
//			n = psmt.executeUpdate();
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}finally {
//			close();
//		}
//		return n;
//	}
}
