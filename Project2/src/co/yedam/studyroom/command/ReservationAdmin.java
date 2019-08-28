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
		if(p != null & !p.equals("")) {
			pageNum = Integer.parseInt(p);
		}
		
		// 검색용
		ReservationDto search = new ReservationDto();
		// search.set** 해서 검색조건 넣으면 된다
		
		// PagingReservation 정보 저장
		PagingReservation paging = new PagingReservation();
		paging.setPageUnit(2); // 한 페이지에 출력할 레코드
		paging.setPage(pageNum);
		paging.setTotalRecord(dao.count(search));
		
		search.setStart(paging.getFirst());
		search.setEnd(paging.getLast());
		// getFirst, getLast :현재 페이지의 첫번째와 마지막 레코드 번호를 설정 및 반환
		// start, end :첫번째, 마지막 레코드 (검색할때 쓸것임)
		
		ArrayList<ReservationDto> list = new ArrayList<ReservationDto>();
		
		
		
		
		
		
		list = dao.adminList();

		request.setAttribute("list", list);

		String viewPage = "jsp/admin_reservationList.jsp";	// 기존 방식

		
//		String viewPage = "jsp/admin_reservaion_datatables.jsp"; // DataTables 이용 (잘 안됨..)
		
		
		System.out.println(viewPage);
		HttpRes.forward(request, response, viewPage);

	}

}
