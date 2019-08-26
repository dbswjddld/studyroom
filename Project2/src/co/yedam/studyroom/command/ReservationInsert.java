package co.yedam.studyroom.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.dto.ReservationDto;

public class ReservationInsert implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ReservationDto dto = new ReservationDto();
		
		String id = request.getParameter("id");
		String usedate = request.getParameter("usedate");

	}

}
