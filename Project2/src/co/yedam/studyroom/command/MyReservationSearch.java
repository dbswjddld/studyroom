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
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();
		ReservationDao dao = new ReservationDao();
		
		String search = request.getParameter("option");
		list = dao.myListSearch("asdf", search);	////////// !! 아이디
		
		request.setAttribute("list", list);

		String viewPage = "jsp/my_reservationList.jsp";
		HttpRes.forward(request, response, viewPage);

	}

}
