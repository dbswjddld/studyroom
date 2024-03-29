package co.yedam.studyroom.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.command.AdminRoomDel;
import co.yedam.studyroom.command.AdminRoomEditPage;
import co.yedam.studyroom.command.AdminRoomInsert;
import co.yedam.studyroom.command.AdminRoomInsertPage;
import co.yedam.studyroom.command.AdminRoomUpdate;
import co.yedam.studyroom.command.GetReply;
import co.yedam.studyroom.command.GetStudyroom;
import co.yedam.studyroom.command.Index;
import co.yedam.studyroom.command.Information;
import co.yedam.studyroom.command.Logout;
import co.yedam.studyroom.command.MemberEdit;
import co.yedam.studyroom.command.MemberEditLogin;
import co.yedam.studyroom.command.MemberEditUpdate;
import co.yedam.studyroom.command.MemberJoin;
import co.yedam.studyroom.command.MemberJoinOk;
import co.yedam.studyroom.command.MemberList;
import co.yedam.studyroom.command.MemberLogin;
import co.yedam.studyroom.command.MemberLoginOk;
import co.yedam.studyroom.command.MemberWithdrawal;
import co.yedam.studyroom.command.MyQna;
import co.yedam.studyroom.command.MyReservation;
import co.yedam.studyroom.command.Qna;
import co.yedam.studyroom.command.QnaDel;
import co.yedam.studyroom.command.QnaRead;
import co.yedam.studyroom.command.QnaUpdate;
import co.yedam.studyroom.command.QnaUpdatePage;
import co.yedam.studyroom.command.QnaWrite;
import co.yedam.studyroom.command.QnaWritePage;
import co.yedam.studyroom.command.ReplyDelete;
import co.yedam.studyroom.command.ReplyInsert;
import co.yedam.studyroom.command.ReplyUpdate;
import co.yedam.studyroom.command.ReplyUpdateGet;
import co.yedam.studyroom.command.ReservationPage;
import co.yedam.studyroom.command.Studyroom;
import co.yedam.studyroom.command.ReservationAdmin;
import co.yedam.studyroom.command.ReservationCancel;
import co.yedam.studyroom.command.ReservationCancelAdmin;
import co.yedam.studyroom.command.ReservationContents;
import co.yedam.studyroom.command.ReservationContentsAdmin;
import co.yedam.studyroom.command.ReservationInsert;
import co.yedam.studyroom.common.Command;

@WebServlet("/FController")
public class FController extends HttpServlet {
	private HashMap<String, Command> map;
	
	private static final long serialVersionUID = 1L;
    public FController() {
        super();
    }

	public void init(ServletConfig config) throws ServletException {
		map = new HashMap<String, Command>();
		// 여기다 각자 map.put(... , ...); 만들어넣기
		
		// 윤정
		map.put("/Index.do", new Index()); // 메인 화면으로 이동
		map.put("/ReservationAdmin.do", new ReservationAdmin()); // 관리자 - 예약관리 페이지로 이동
		map.put("/ReservationContentsAdmin.do", new ReservationContentsAdmin()); // 관리자 - 예약관리 - 컨텐츠
		map.put("/ReservationCancelAdmin.do", new ReservationCancelAdmin()); // 관리자 - 예약관리 - 컨텐츠 - 예약취소 눌렀을 때
		map.put("/MyReservation.do", new MyReservation());	// 마이페이지 - 예약내역 - 전체 페이지로 이동
		map.put("/ReservationContents.do", new ReservationContents()); // 마이페이지 - 예약 상세보기
		map.put("/ReservationCancel.do", new ReservationCancel()); // 마이페이지 - 예약 취소하기
		map.put("/ReservationPage.do", new ReservationPage()); // 예약하기 페이지로 이동
		map.put("/ReservationInsert.do", new ReservationInsert()); // 예약하기 DB처리하기
		map.put("/Information.do", new Information()); // 이용안내 페이지로 이동
		
		
		
		
		
		
		// 무겸
		map.put("/MemberLogin.do", new MemberLogin());// 로그인 화면으로 보내기
		map.put("/MemberLoginOk.do", new MemberLoginOk());// 로그인 버튼 눌렀을때 DB입력
		map.put("/Logout.do", new Logout()); //로그아웃
		map.put("/MemberJoin.do", new MemberJoin()); //회원가입 화면으로 보내기
		map.put("/MemberJoinOk.do", new MemberJoinOk()); //회원가입
		map.put("/MemberEditLogin.do", new MemberEditLogin()); //회원정보수정 로그인 화면 보내기
		map.put("/MemberEditFrm.do", new MemberEdit()); //회원정보수정 페이지 보내기
		map.put("/MemberEdit.do", new MemberEditUpdate()); //회원정보수정완료
		map.put("/MemberWithdrawal.do", new MemberWithdrawal()); //회원정보 탈퇴 페이지 
		map.put("/MemberList.do", new MemberList()); //회원정보보기 
		
		
		
		
		
		
		// 동우
		map.put("/Qna.do",new Qna());	//문의게시판리스트  //20190820 09:46 곽동우
		map.put("/QnaRead.do",new QnaRead());	//문의게시판내용  //20190819 17:55 곽동우
		map.put("/QnaDel.do",new QnaDel());		//문의 게시글 삭제	//0822	곽동우
		map.put("/QnaUpdate.do",new QnaUpdate());	//문의 게시글 삭제	//0822	곽동우
		map.put("/QnaWrite.do", new QnaWrite()); //문의 게시글쓰기		//0822 곽동우
		map.put("/QnaWritePage.do", new QnaWritePage()); //문의 게시글쓰기폼 이동 //0823 곽동우
		map.put("/QnaUpdatePage.do", new QnaUpdatePage());	//문의 게시글 수정페이지 이동 //0823 곽동우
		map.put("/GetReply.do", new GetReply());		/// 게시글 댓글 불러옴 // 0826 곽동우 
		map.put("/ReplyInsert.do", new ReplyInsert());	//댓글달기 	//20190826 곽동우
		map.put("/replyUpdateGet.do", new ReplyUpdateGet()); //댓글창에 (수정)누르면 내용불러옴  //20190827 곽동우
		map.put("/replyUpdate.do", new ReplyUpdate());	//    (댓글수정) 버튼 누르면 업데이트됨 //20190827 곽동우
		map.put("/replyDelete.do", new ReplyDelete());	// 댓글삭제함		//0828 곽동우
		map.put("/MyQna.do", new MyQna());	//내문의게시판 첫화면	//0828 곽동우
		map.put("/Studyroom.do", new Studyroom());	//관리자 - 스터디룸 관리  //0828 곽동우
		map.put("/GetStudyroom.do", new GetStudyroom());	//관리자 - 스터디룸 목록가져옴 	// 0829 곽동우
		map.put("/adminRoomInsertPage.do", new AdminRoomInsertPage());	//관리자 - 스터디룸관리 - 스터디룸등록페이지 이동	// 0829 곽동우
		map.put("/AdminRoomInsert.do", new AdminRoomInsert());			//관리자 - 스터디룸관리 - 스터디룸등록페이지- 스터디룸등록	// 0829 곽동우 
		map.put("/adminRoomEditPage.do", new AdminRoomEditPage());	//관리자 - 스터디룸수정페이지	// 0829 곽동우 
		map.put("/AdminRoomUpdate.do", new AdminRoomUpdate());	//관리자 - 스터디룸수정! //0829 곽동우
		map.put("/AdminRoomDel.do", new AdminRoomDel());	//관리자 - 스터디룸삭제! //0829 곽동우
	
		
	}

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");		// 20190822 곽동우
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length());
		
		Command command = map.get(path);
		command.execute(request, response);
	}

}
