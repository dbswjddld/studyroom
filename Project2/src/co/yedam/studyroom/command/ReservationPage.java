package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;

public class ReservationPage implements Command {
	// [윤정 190820] 예약하기jsp 페이지로 이동
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String viewPage = "jsp/reservatoin.jsp";
		HttpRes.forward(request, response, viewPage);
	}

}
