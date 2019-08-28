package co.yedam.studyroom.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.ReservationDao;
import co.yedam.studyroom.dto.ReservationDto;

public class MyReservationSearch implements Command {
	// [윤정 190819] 마이페이지 - 예약내역 - 검색
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String id = request.getParameter("id");
		String search = request.getParameter("search");
		
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();
		ReservationDao dao = new ReservationDao();
		
		if(search.equals("전체")) {
			list = dao.myList(id);
		} else {
			list = dao.myListSearch(id, search);
		}
		
		String viewPage = "jsp/my_reservationList.jsp";
		request.setAttribute("list", list);
		request.setAttribute("searchOpt", search);
		HttpRes.forward(request, response, viewPage);

	}

}
