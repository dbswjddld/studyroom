package co.yedam.studyroom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import co.yedam.studyroom.common.DAO;
import co.yedam.studyroom.dto.BoardDto;
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
			String sql = "select * from comments where bno=?";
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
		
		


}
