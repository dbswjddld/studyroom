package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.MemberDao;
import co.yedam.studyroom.dto.MemberDto;

public class MemberWithdrawal implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MemberDto dto = new MemberDto();
		dto.setId(request.getParameter("id"));
		
		MemberDao dao = new MemberDao();
		int result = dao.Withdrawal(dto);
		HttpSession session = request.getSession();
		session.invalidate();
		request.setAttribute("result", result);
		String viewPage = "jsp/MemberWithdrawal.jsp";
		HttpRes.forward(request, response, viewPage);
		
	}

}