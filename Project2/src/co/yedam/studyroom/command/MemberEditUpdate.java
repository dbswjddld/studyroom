package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.MemberDao;
import co.yedam.studyroom.dto.MemberDto;

public class MemberEditUpdate implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MemberDto dto = new MemberDto();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setEmail(request.getParameter("email"));
		dto.setEmailres(request.getParameter("emailres"));
		System.out.println("email res : " + request.getParameter("emailres"));
		
		dto.setTel(request.getParameter("tel"));
		
		MemberDao dao = new MemberDao();
		int result = dao.update(dto);
		
//		request.setAttribute("result", result);
		String viewPage = "jsp/MemberEditLogin.jsp";
		HttpRes.forward(request, response, viewPage);
		
	}

}
