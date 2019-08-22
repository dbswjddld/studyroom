package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.MemberDao;
import co.yedam.studyroom.dto.MemberDto;

public class MemberEdit implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MemberDto dto = new MemberDto();
		dto.setId((String)request.getSession().getAttribute("mid"));

		MemberDao dao = new MemberDao();
		MemberDto result = dao.serach(dto);
		
		request.setAttribute("result", result);
		String viewPage = "jsp/MemberEdit.jsp";
		HttpRes.forward(request, response, viewPage);
	}
}
