package co.yedam.studyroom.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.MemberDao;
import co.yedam.studyroom.dto.MemberDto;

public class MemberList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MemberDao dao = new MemberDao();
		List<MemberDto> list = dao.getMemberList();
		
		request.setAttribute("list", list);
		String viewPage = "jsp/MemberList.jsp";
		HttpRes.forward(request, response, viewPage);
		
			
	}

}
