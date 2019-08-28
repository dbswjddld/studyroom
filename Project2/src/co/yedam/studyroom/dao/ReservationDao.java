package co.yedam.studyroom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.yedam.studyroom.common.DAO;
import co.yedam.studyroom.dto.ReservationDto;

public class ReservationDao {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private ReservationDto dto = null;

//	생성자
	public ReservationDao() {
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

	///////////////// 메소드 ///////////////////////
	// [윤정 190818] 관리자메뉴 - 예약내역 리스트 ------ResvPaging으로 대체
	public ArrayList<ReservationDto> adminList() {
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();
		String sql = "SELECT id, usedate, starttime, endtime, rname, status, rno FROM reservation ORDER BY usedate DESC";
		try {
			System.out.println(conn);
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new ReservationDto();
				dto.setId(rs.getString(1));
				dto.setUsedate(rs.getString(2).substring(0,10));
				dto.setStarttime(rs.getString(3).substring(11,16));
				dto.setEndtime(rs.getString(4).substring(11,16));
				dto.setRname(rs.getString(5));
				dto.setStatus(rs.getString(6));
				dto.setRno(rs.getInt(7)); // 예약번호
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// [윤정 190819] 마이페이지 - 예약 내역 (전체)
	public ArrayList<ReservationDto> myList(String id) {
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();
		String sql = "SELECT usedate, starttime, endtime, rname, status, rno FROM reservation WHERE id = ? ORDER BY usedate DESC";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new ReservationDto();
				dto.setUsedate(rs.getString(1).substring(0,10));
				dto.setStarttime(rs.getString(2).substring(11,16));
				dto.setEndtime(rs.getString(3).substring(11,16));
				dto.setRname(rs.getString(4));
				dto.setStatus(rs.getString(5));
				dto.setRno(rs.getInt(6));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// [윤정 190819] 마이페이지 - 예약 내역 - 검색옵션 (취소, 이용 완료, 예약 완료)
	public ArrayList<ReservationDto> myListSearch(String id, String search) {
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();
		String sql = "SELECT usedate, starttime, endtime, rname, status, rno FROM reservation WHERE id = ? AND status = ? ORDER BY usedate DESC";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, search);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new ReservationDto();
				dto.setUsedate(rs.getString(1).substring(0,10));
				dto.setStarttime(rs.getString(2).substring(11,16));
				dto.setEndtime(rs.getString(3).substring(11,16));
				dto.setRname(rs.getString(4));
				dto.setStatus(rs.getString(5));
				dto.setRno(rs.getInt(6));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	// [윤정 190819] 예약 세부내용 보기
	public ReservationDto contents (int rno) {
		dto = new ReservationDto();
		String sql = "SELECT rname, usedate, starttime, endtime, status, reqdate, rnum, rno "
				+ "FROM reservation WHERE rno = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rno);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new ReservationDto();
				dto.setRname(rs.getString(1));
				dto.setUsedate(rs.getString(2).substring(0,10));
				dto.setStarttime(rs.getString(3).substring(11,16));
				dto.setEndtime(rs.getString(4).substring(11,16));
				dto.setStatus(rs.getString(5));
				dto.setReqdate(rs.getString(6));
				dto.setRnum(rs.getInt(7));
				dto.setRno(rs.getInt(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	// [윤정 190820] 예약 취소하기
	public int cancel(int rno) {
		int result = 0;
		String sql = "UPDATE reservation SET status = '예약취소' WHERE rno = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, rno);
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	// [윤정 0827] 예약하기
	public int insert(ReservationDto dto) {
		int result = 0;
		/* 
		-- rnum(방코드) rname id usedate starttime endtime rno(예약번호) status reqdate
		INSERT INTO reservation (rnum, rname, id, usedate, starttime, endtime, rno, status, reqdate)
		VALUES (2, '6인실', '1234', to_date('2019-08-23','YYYY-MM-DD'), 
				to_timestamp('9:00','HH24:MI'), to_timestamp('10:00','HH24:MI'),(select max(rno) from reservation)+1, null, sysdate);
		 */
		String sql = "INSERT INTO reservation (rnum, rname, id, usedate, starttime, endtime, rno, status, reqdate) "
				+ "VALUES (?, ?, ?,"
				+ " to_date('" + dto.getUsedate() + "','YYYY-MM-DD'),"
				+ " to_timestamp('" + dto.getUsedate() + " " + dto.getStarttime() + "','YYYY-MM-DD HH24'),"
				+ " to_timestamp('" + dto.getUsedate() + " " + dto.getEndtime() + "','YYYY-MM-DD HH24'), " 
				+ "(select max(rno) from reservation)+1, '예약완료', sysdate)";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getRnum());
			psmt.setString(2, dto.getRname());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// [윤정 0828] 레코드 건수 조회 (페이징 할때 쓸 것)
	public int count(ReservationDto search) {
		int result = 0;
		
		// 검색 조건
		String where = " where 1 = 1 ";
		// where += " AND * = * " 조건 작성
		
		String sql = "SELECT count(*) FROM reservation " + where;
		try {
			psmt = conn.prepareStatement(sql);
			
			// 조건값 세팅(검색)
			//int pos = 1;
			
			rs = psmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return result;
	}

	// [윤정 0828]페이징해서 예약 리스트 출력
	public ArrayList<ReservationDto> ResvPaging(ReservationDto search) {
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();
		
		// 검색조건
		String where = " where 1 = 1 ";
		
		String sql = "SELECT b.* FROM ( SELECT rownum no, a.* FROM ( SELECT * FROM reservation "
				+ where
				+ "ORDER BY usedate desc ) a ) b WHERE no BETWEEN ? AND ?";
		try {
			psmt = conn.prepareStatement(sql);
			
			int pos = 1;
			// 검색조건 값 세팅
			
			// BETWEEN ? AND ?
			psmt.setInt(pos++, search.getStart());
			psmt.setInt(pos++, search.getEnd());
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new ReservationDto();
				dto.setId(rs.getString("id"));
				dto.setUsedate(rs.getString("usedate").substring(0,10));
				dto.setStarttime(rs.getString("starttime").substring(11,16));
				dto.setEndtime(rs.getString("endtime").substring(11,16));
				dto.setRname(rs.getString("rname"));
				dto.setStatus(rs.getString("status"));
				dto.setRno(rs.getInt("rno"));
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
