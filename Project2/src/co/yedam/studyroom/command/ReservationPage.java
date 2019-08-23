package co.yedam.studyroom.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.StudyroomDao;
import co.yedam.studyroom.dto.StudyroomDto;

public class ReservationPage implements Command {
	// [윤정 190820] 예약하기jsp 페이지로 이동
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ArrayList<StudyroomDto> list = new ArrayList<>();
		StudyroomDao dao = new StudyroomDao();
		list = dao.search();
		
		request.setAttribute("room", list);
		
		String viewPage = "jsp/reservatoin.jsp";
		HttpRes.forward(request, response, viewPage);
	}

}
