package co.yedam.studyroom.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.dao.MemberDao;
import co.yedam.studyroom.dto.MemberDto;

@WebServlet("/DeptListPagingServ")
public class DeptListPagingServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//페이지번호 파라미터
		String p = request.getParameter("p");
		int pageNum = 1;
		if(p != null && ! p.equals("")) {
			pageNum = Integer.parseInt(p);
		}		
		MemberDto dto = new MemberDto();
		dto.setId(request.getParameter("id"));
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));
		dto.setGrant(request.getParameter("grant"));
		//paging 정보 저장
		Paging paging = new Paging();
		paging.setPageUnit(5);
		paging.setTotalRecord(MemberDao.getInstance().count(dto));
		paging.setPage(pageNum);	
		//회원목록
		dto.setStart(paging.getFirst());
		dto.setEnd(paging.getLast());
		request.setAttribute("list", MemberDao.getInstance().getMemberList(dto));
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("jsp/MemberList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
