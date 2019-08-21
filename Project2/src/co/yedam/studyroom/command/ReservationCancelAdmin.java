package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.ReservationDao;

public class ReservationCancelAdmin implements Command {
	// [윤정 190820] 예약취소
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		int rno = Integer.valueOf(request.getParameter("rno"));
		
		ReservationDao dao = new ReservationDao();
		int result = dao.cancel(rno);
		
		request.setAttribute("cancelResult", result);
		String viewPage = "ReservationAdmin.do";
		HttpRes.forward(request, response, viewPage);
	}

}
