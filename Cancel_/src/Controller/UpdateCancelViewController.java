package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Persistance.CancelDAO;
import Persistance.CancelDTO;

@WebServlet("/updateview")
public class UpdateCancelViewController extends HttpServlet{
	private CancelDAO canceldao = new CancelDAO();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String rID = req.getParameter("id");
		System.out.println("��ȸ�� ID : " + rID);
		CancelDTO dto = canceldao.inquiryC(rID);
		
		System.out.println("TEST : " + dto.getReservation_Name());
		
		req.setAttribute("dto", dto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/UpdateCancelView.jsp");
		dispatcher.forward(req, resp);
	}
}
