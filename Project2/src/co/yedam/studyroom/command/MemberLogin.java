package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpUtils;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;

public class MemberLogin implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String viewPage = "jsp/MemberLogin.jsp";
		HttpRes.forward(request, response, viewPage);
	}

}
