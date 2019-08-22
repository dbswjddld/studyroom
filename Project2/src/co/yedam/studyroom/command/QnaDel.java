package co.yedam.studyroom.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.studyroom.common.Command;
import co.yedam.studyroom.common.HttpRes;
import co.yedam.studyroom.dao.BoardDao;

public class QnaDel implements Command {

	//문의 게시글 삭제  //곽동우
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		BoardDao dao = new BoardDao();
		int bno = 0;
		bno = Integer.parseInt(request.getParameter("bno"));
		dao.boardDelete(bno);
		
		String viewPage = "Qna.do";
		
		HttpRes.forward(request, response, viewPage);
		
	}

}
