package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;

public class QnaWritePage implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String sid = request.getParameter("sid");
		
		request.setAttribute("sid", sid);	//탑메뉴에있을건데 쓸필요있나?
		String viewPage = "jsp/qnawritepage.jsp";
		
		HttpRes.forward(request, response, viewPage);

	}

}
