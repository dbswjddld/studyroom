package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.dao.MemberDao;


@WebServlet("/IdChk")
public class IdChk extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public IdChk() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
		String inputId = request.getParameter("id");
		String result = dao.idCheck(inputId);
		
		request.setAttribute("result", result);
		RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/MemberId.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

}
