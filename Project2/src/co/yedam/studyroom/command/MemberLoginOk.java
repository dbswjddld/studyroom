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

public class MemberLoginOk implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		MemberDto dto = new MemberDto();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
		MemberDao dao = new MemberDao();
		
		MemberDto loginResult = new MemberDto();
		loginResult = dao.login(dto);
		// id,pw가 일치하면 name에 사용자의 id와 이름이 저장되고, 
		//아니면 null
		
		String viewPage;
		if(loginResult == null) {
			request.setAttribute("result", "fail");
			viewPage = "jsp/MemberLogin.jsp";
		}else {
			HttpSession session = request.getSession(true); //세션생성
			session.setAttribute("mid", loginResult.getId()); //세션에 값 담기
			session.setAttribute("mgrant", loginResult.getGrant());
			viewPage = "jsp/MemberLoginResult.jsp";
			//로그인 결과 페이지에 사용자의 이름 넘겨주기
		}
		HttpRes.forward(request, response, viewPage);
	}

}
