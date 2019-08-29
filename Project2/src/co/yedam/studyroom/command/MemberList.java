package co.yedam.studyroom.command;

import java.io.IOException;
import java.util.ArrayList;
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

//		List<MemberDto> list = new ArrayList<MemberDto>();
//		MemberDao dao = new MemberDao();
//		list = dao.select();
//		request.setAttribute("list", list);
//		System.out.println(list.size());
//		String viewPage = "jsp/MemberList.jsp";
//		HttpRes.forward(request, response, viewPage);
//		
		
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
	}

