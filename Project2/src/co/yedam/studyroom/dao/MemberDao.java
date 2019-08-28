package co.yedam.studyroom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import co.yedam.studyroom.command.ConnectionManager;
import co.yedam.studyroom.common.DAO;
import co.yedam.studyroom.dto.DeptDto;
import co.yedam.studyroom.dto.MemberDto;

public class MemberDao {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private MemberDto dto;
	private Statement dao;

//	생성자
	public MemberDao() {
		conn = DAO.conn();
	}

	// 싱글톤 구현
	public static MemberDao instance = new MemberDao();

	public static MemberDao getInstance() {
		return instance;
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

	// 로그인
	public MemberDto login(MemberDto dto) {
		MemberDto output = null;
		String sql = "SELECT id, mgrant FROM member WHERE id = ? AND pw = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			rs = psmt.executeQuery();
			if (rs.next()) {
				output = new MemberDto();
				output.setId(rs.getString("id"));
				output.setGrant(rs.getString("mgrant"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return output;
	}

	// 회원가입
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
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	// ID 중복확인
	public String idCheck(String input) {
		String result = null;
		String sql = "SELECT id FROM member WHERE id =?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, input);
			rs = psmt.executeQuery();
			if (rs.next()) // 해당 id가 이미 있으면 1
				result = rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;

	}

	public int update(MemberDto dto) { // 회원정보수정
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
		} catch (SQLException e) {
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
			if (rs.next()) {
				output = new MemberDto();
				output.setId(rs.getString("id"));
				output.setPw(rs.getString("pw"));
				output.setEmail(rs.getString("email"));
				output.setEmailres(rs.getString("emailres"));
				output.setTel(rs.getString("tel"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return output;
	}

	public int Withdrawal(MemberDto dto) { // 회원정보삭제
		int n = 0;
		String sql = "update member set mgrant = ? where id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "X");
			psmt.setString(2, dto.getId());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	public List<MemberDto> getMemberList() {
		String sql = "SELECT * FROM member";
		MemberDto dto = null; // MemberDto dto =null;
		List<MemberDto> list = new ArrayList<MemberDto>(); // list<MemberDto>
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new MemberDto(); // dto = new MemberDto();
				dto.setId(rs.getString("id")); // dto.setId(rs.getInt("id?"))
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setGrant(rs.getString("mgrant"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	// 검색조회
	public List<MemberDto> getMemberList(MemberDto dto) {
		List<MemberDto> list = new ArrayList<MemberDto>();
		String whereCondition = " where 1 = 1 ";
		if (dto.getId() != null && !dto.getId().equals("")) {
			whereCondition += " and id = ? ";
		}
		if (dto.getEmail() != null && !dto.getEmail().equals("")) {
			whereCondition += " and email = ? ";
		}
		if (dto.getTel() != null && !dto.getTel().equals("")) {
			whereCondition += " and tel = ? ";
		}
		if (dto.getGrant() != null && !dto.getGrant().equals("")) {
			whereCondition += " and grant = ? ";
		}
		try {
			conn = ConnectionManager.connect();
			String sql = "select b.*  from( select a.*, rownum rn  from ( "
					+ "SELECT department_id, department_name, manager_id, location_id " + "  FROM departments"
					+ whereCondition + " ORDER BY department_id " + " ) a   ) b  where rn between ? and ?	";
			psmt = conn.prepareStatement(sql);
			int pos = 1;
			if (dto.getId() != null && !dto.getId().equals("")) {
				psmt.setString(pos++, dto.getId());
			}
			if (dto.getEmail() != null && !dto.getEmail().equals("")) {
				psmt.setString(pos++, dto.getEmail());
			}
			if (dto.getTel() != null && !dto.getTel().equals("")) {
				psmt.setString(pos++, dto.getTel());
			}
			if (dto.getGrant() != null && !dto.getGrant().equals("")) {
				psmt.setString(pos++, dto.getGrant());
			}
			psmt.setInt(pos++, dto.getStart());
			psmt.setInt(pos++, dto.getEnd());
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new MemberDto();
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				dto.setTel(rs.getString("tel"));
				dto.setGrant(rs.getString("mgrant"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return list;
	}

	// 레코드 건수 조회
	public int count(MemberDto dto) {
		int cnt = 0;
		try {
			conn = ConnectionManager.connect();
			// 동적 조건 추가
			String whereCondition = " where 1 = 1 ";
			if (dto.getId() != null && !dto.getId().equals("")) {
				whereCondition += " and id = ? ";
			}
			if (dto.getEmail() != null && !dto.getEmail().equals("")) {
				whereCondition += " and email = ? ";
			}
			if (dto.getTel() != null && !dto.getTel().equals("")) {
				whereCondition += " and tel = ? ";
			}
			if (dto.getGrant() != null && !dto.getGrant().equals("")) {
				whereCondition += " and grant = ? ";
			}

			String sql = "select count(*) from departments" + whereCondition;
			psmt = conn.prepareStatement(sql);

			// 조건값 셋팅
			int pos = 1;
			if (dto.getId() != null && !dto.getId().equals("")) {
				psmt.setString(pos++, dto.getId());
			}
			if (dto.getEmail() != null && !dto.getEmail().equals("")) {
				psmt.setString(pos++, dto.getEmail());
			}
			if (dto.getTel() != null && !dto.getTel().equals("")) {
				psmt.setString(pos++, dto.getTel());
			}
			if (dto.getGrant() != null && !dto.getGrant().equals("")) {
				psmt.setString(pos++, dto.getGrant());
			}
			ResultSet rs = psmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.close(conn);
		}
		return cnt;
	}
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
