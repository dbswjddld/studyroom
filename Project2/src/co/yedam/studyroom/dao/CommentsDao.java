package co.yedam.studyroom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import co.yedam.studyroom.common.DAO;
import co.yedam.studyroom.dto.CommentsDto;

/**
 * 
 * @author 곽동우 20190826
 *
 */
public class CommentsDao {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private CommentsDto dto;

//	생성자
	public CommentsDao() {
		conn = DAO.conn();
	}
	
	
	// 20190826 곽동우 // 게시글 댓글 불러오기
		public ArrayList<Map<String, Object>> commenstList(CommentsDto dto) {
			String sql = "select * from comments where bno=? order by cno desc";
			ArrayList<Map<String, Object>> list = new ArrayList<>();
			
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, dto.getBno());
				rs = psmt.executeQuery();
				while (rs.next()) {
					HashMap<String,Object> map = new HashMap<String, Object>();
					map.put("cno",Integer.toString(rs.getInt("cno")));
					map.put("id",rs.getString("id"));
					map.put("reply",rs.getString("reply"));
					map.put("cdate",rs.getString("cdate"));
					list.add(map);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				DAO.close(conn, psmt, rs);	//z클로즈
			}
			return list;
		}// boardList end
		
		//댓글달기 
		public int insertComments(CommentsDto comments) {
			int r = 0;
			String sql = "insert into comments (bno, cno, id, reply, cdate)"
					+ " values(?, ?, ?, ?, sysdate)";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, comments.getBno());
				psmt.setInt(2, comments.getCno());
				psmt.setString(3, comments.getId());
				psmt.setString(4, comments.getReply());
				r = psmt.executeUpdate();
				System.out.println(r + " row inserted.");

			} catch (SQLException e) {
				e.printStackTrace();
			}
			return r;
		}
		
		//0827 새댓글 가져오기
		public ArrayList<Map<String, Object>> newComments(int cno) {
			String sql = "select * from comments where cno = ?";
			ArrayList<Map<String, Object>> list = new ArrayList<>();
			
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, cno);
				rs = psmt.executeQuery();
				if(rs.next()) {
					HashMap<String,Object> map = new HashMap<String, Object>();
					map.put("cno",Integer.toString(rs.getInt("cno")));
					map.put("id",rs.getString("id"));
					map.put("reply",rs.getString("reply"));
					map.put("cdate",rs.getString("cdate"));
					list.add(map);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
		//0827 곽동우
		//댓글 업데이트
		public int updateComment(CommentsDto dto) {
			int n = 0;
			String sql = "update comments set id=?, reply=?, cdate=sysdate where cno=? ";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getReply());
				//psmt.setString(3, "sysdate");
				psmt.setInt(3, dto.getCno());
				n = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				//DAO.close(conn, psmt, rs);
			}
			System.out.println(n+"댓글업뎃");
			return n;
		}
		
		
		//0826 곽동우 새댓글 번호 가져오기
		public int getCommentsNo() {
			int n = 0;
			String sql = "select max(cno)+1 as cno from comments";
			try {
				psmt = conn.prepareStatement(sql);
				rs = psmt.executeQuery();
				if(rs.next()) {
					n = rs.getInt("cno");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return n;
			
		}

		//댓글삭제하기       0828 곽동우
		public int deleteComment(int cno) {
			int n = 0;
			String sql = "delete comments where cno = ?";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, cno);
				n = psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DAO.close(conn, psmt, rs);
			}
			return n;
			
		}



}
