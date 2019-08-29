package co.yedam.studyroom.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.ReservationDao;
import co.yedam.studyroom.dto.ReservationDto;

public class ReservationInsert implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ReservationDto dto = new ReservationDto();
		
		String id = request.getParameter("id");
		String usedate = request.getParameter("usedate");
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		String rname = request.getParameter("rname");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		
		dto.setId(id);
		dto.setUsedate(usedate);
		dto.setRnum(rnum);
		dto.setRname(rname);
		dto.setStarttime(starttime);
		dto.setEndtime(endtime);
		
		ReservationDao dao = new ReservationDao();
		
		// 예약번호 세팅
		int rno = dao.getRno();
		dto.setRno(rno);
		int result = dao.insert(dto);
		
		request.setAttribute("result", result);
		
		String viewPage = "jsp/ReservationResult.jsp";
		HttpRes.forward(request, response, viewPage);
	}

}
