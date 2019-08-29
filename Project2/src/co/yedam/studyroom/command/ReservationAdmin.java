package co.yedam.studyroom.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.ReservationDao;
import co.yedam.studyroom.dto.ReservationDto;

public class ReservationAdmin implements Command {
	// [윤정 190819]관리자페이지 - 예약내역
	// [윤정 190828] 페이징 기능 추가중
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ReservationDao dao = new ReservationDao();
		
		// 입력한 페이지 받아오기 
		String p = request.getParameter("p");
		int pageNum = 1;
		if(p != null && !p.equals("")) {
			pageNum = Integer.parseInt(p);
		}
		
		// n건씩 출력
		String print = request.getParameter("print");
		int printNum;
		if(print != null && !print.equals("")) {
			printNum = Integer.parseInt(p);
		} else {
			printNum = 10;
		}
		
		// 검색
		ReservationDto search = new ReservationDto();
		String searchOpt = request.getParameter("searchOpt");
		String searchVal = request.getParameter("searchVal");
		String where ;
		if (searchVal == null || searchVal.equals("") || searchVal.equals("[object Object]")) // 검색내용을 작성하지 않은 경우
			where = " where 1 = 1 ";
		else // 검색내용을 작성한 경우
			where = " where " + searchOpt + " like '%" + searchVal + "%' ";
		
		// PagingReservation 정보 저장
		PagingReservation paging = new PagingReservation();
		paging.setPageUnit(printNum); // 한 페이지에 출력할 레코드
		paging.setPage(10);
		paging.setTotalRecord(dao.count(search, where));
		
		// 페이지에 출력할 레코드 (몇번째부터 몇번째까지)
		search.setStart(paging.getFirst());
		search.setEnd(paging.getLast());
		// getFirst, getLast :현재 페이지의 첫번째와 마지막 레코드 번호를 설정 및 반환
		// start, end :첫번째, 마지막 레코드 (검색할때 쓸것임)
		
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();
		list = dao.ResvPaging(search, where);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		
		String viewPage = "jsp/admin_reservationList.jsp";	// 기존 방식

		
//		String viewPage = "jsp/admin_reservaion_datatables.jsp"; // DataTables 이용 (잘 안됨..)
		
		HttpRes.forward(request, response, viewPage);

	}

}
