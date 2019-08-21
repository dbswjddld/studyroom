package co.yedam.studyroom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	// [윤정 190818] 관리자메뉴 - 예약내역 리스트
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
				dto.setUsedate(rs.getDate(2));
				dto.setStarttime(rs.getTime(3));
				dto.setEndtime(rs.getTime(4));
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
				dto.setUsedate(rs.getDate(1));
				dto.setStarttime(rs.getTime(2));
				dto.setEndtime(rs.getTime(3));
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
		if(search.equals("null")) // 예약완료 상태를 검색할때 (status is null)
			sql = "SELECT usedate, starttime, endtime, rname, status, rno FROM reservation WHERE id = ? AND status is null ORDER BY usedate DESC";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			if(!search.equals("null")) psmt.setString(2, search);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto = new ReservationDto();
				dto.setUsedate(rs.getDate(1));
				dto.setStarttime(rs.getTime(2));
				dto.setEndtime(rs.getTime(3));
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
				dto.setUsedate(rs.getDate(2));
				dto.setStarttime(rs.getTime(3));
				dto.setEndtime(rs.getTime(4));
				dto.setStatus(rs.getString(5));
				dto.setReqdate(rs.getDate(6));
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
		String sql = "UPDATE reservation SET status = '0' WHERE rno = ?";
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
}
