package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Persistance.ReservationDAO;
import Persistance.ReservationDTO;

@WebServlet("/updateview")
public class UpdateViewController extends HttpServlet{
	private ReservationDAO reservedao = new ReservationDAO();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String rID = req.getParameter("id");
		System.out.println("��ȸ�� ID : " + rID);
		ReservationDTO dto = reservedao.inquiry(rID);
		
		System.out.println("TEST : " + dto.getReservation_Name());
		
		req.setAttribute("dto", dto);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/UpdateReserveView.jsp");
		dispatcher.forward(req, resp);
	}
}
