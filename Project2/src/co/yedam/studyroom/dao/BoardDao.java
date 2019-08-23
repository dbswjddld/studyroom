package co.yedam.studyroom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import co.yedam.studyroom.common.DAO;
import co.yedam.studyroom.dto.BoardDto;

public class BoardDao {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private BoardDto dto;

//	생성자
	public BoardDao() {
		conn = DAO.conn();
	}

	// 20190820 09:52 곽동우 // 게시판 리스트보기
	public ArrayList<BoardDto> boardList() {
		String sql = "select * from board order by bno";
		dto = null;
		ArrayList<BoardDto> list = new ArrayList<>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new BoardDto();
				dto.setBno(rs.getInt("bno"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setBdate(rs.getTimestamp("bdate"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}// boardList end
	
	//20190822 15:36 곽동우 // 클릭한 게시글 조회 
	public BoardDto boardSelect(int bno) {
		String sql = "select bno, subject, content, id, bdate from board where bno = ?";	//TO_CHAR(TO_DATE(bdate), 'yyyy/mm/dd HH24:mi:ss') as bdate
		dto = null;
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bno);
			rs = psmt.executeQuery();
			while (rs.next()) {
				dto = new BoardDto();
				dto.setBno(rs.getInt("bno"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setId(rs.getString("id"));
				dto.setBdate(rs.getTimestamp("bdate"));//date 넣어야됨
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return dto;
	}	// boardSelect end
	
	//0822 문의게시글 삭제 곽동우
	public int boardDelete(int bno) {
		int n = 0;
		String sql = "delete board where bno=?";
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bno);
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return n;
	}
	//0823 게시글 번호 가져오기
	public int getBoardNo() {
		int n = 0;
		String sql = "select max(bno)+1 as bno from board";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()) {
				n = rs.getInt("bno");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
		
	}
	
	//0822 문의 게시글 입력
	public int boardInsert(BoardDto dto) {

		int n = 0;
		String sql = "insert into board values(?, ?, ?, ?,sysdate)";//
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getBno());
			psmt.setString(2, dto.getSubject());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getId());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return n;
	}
	
	//0823 문의 게시글 입력
		public int boardUpdate(BoardDto dto) {

			int n = 0;
			String sql = "update board set subject = ?, content = ? where bno = ?";//
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getSubject());
				psmt.setString(2, dto.getContent());
				psmt.setInt(3, dto.getBno());
				n = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return n;
		}
		
	//0823 총게시글수
		public int boardCount() {
			int n = 0;
			String sql = "select count(*) as count from board";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next()) {
					n = rs.getInt("count");
				}
				System.out.println(n);
			} catch (SQLException e) {
				e.printStackTrace();
			}//close() 추가??
			
			return n;
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
