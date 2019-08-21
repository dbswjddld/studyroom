package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;

public class Logout implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		session.invalidate(); //모든세션 삭제
		String viewPage = "jsp/logout.jsp";
		HttpRes.forward(request, response, viewPage);
		
	}

}
