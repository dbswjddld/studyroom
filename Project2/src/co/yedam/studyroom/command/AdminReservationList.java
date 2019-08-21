package co.yedam.studyroom.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import co.yedam.studyroom.dao.ReservationDao;
import co.yedam.studyroom.dto.ReservationDto;
// [윤정 190821] datatables를 이용해서 관리자-예약내역 출력하기
@WebServlet("/AdminReservationList")
public class AdminReservationList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminReservationList() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReservationDao dao = new ReservationDao();
		ArrayList<ReservationDto> list = dao.adminList();
		JSONArray ary = new JSONArray();
		JSONArray orig = new JSONArray();
		JSONObject obj = new JSONObject();
		
		for(ReservationDto dto : list) {
			ary = new JSONArray();
			ary.add(dto.getRname());
			ary.add(dto.getId());
			ary.add(dto.getUsedate());
			ary.add(dto.getStarttime());
			ary.add(dto.getEndtime());
			ary.add(dto.getStatus());
			orig.add(ary);
		}
		obj.put("data", orig);
		response.getWriter().print(obj);
	}
}
