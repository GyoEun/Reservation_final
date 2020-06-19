package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Persistance.*;

@WebServlet("/update")
public class UpdateReserveController extends HttpServlet {
	private ReservationDAO reservedao = new ReservationDAO();
	
	DecimalFormat df = new DecimalFormat("00");
	Calendar currentCalendar = Calendar.getInstance(); 
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String strYear = Integer.toString(currentCalendar.get(Calendar.YEAR));
    	String strMonth = df.format(currentCalendar.get(Calendar.MONTH) + 1);
    	String strDay = df.format(currentCalendar.get(Calendar.DATE));
    	String strDate = strYear + "-" +strMonth +"-"+ strDay; 
    	String Reservation_Date= strDate;
    	
    	String Reservation_Start=req.getParameter("start");
    	String Reservation_End = req.getParameter("end");
    	
    	ReservationDTO dto = new ReservationDTO(req.getParameter("ri"),req.getParameter("fName"), "0", req.getParameter("rName"),
    			req.getParameter("pnum"),  req.getParameter("cnt"), Reservation_Date,Reservation_Start,Reservation_End,
    			req.getParameter("carNum"), req.getParameter("carName"), "0");
	
    	System.out.println(req.getParameter("ri"));
    	System.out.println(req.getParameter("rName"));
    	int rs = reservedao.update(req.getParameter("ri"),dto);
		PrintWriter out = resp.getWriter();
		if(rs==1){
			out.print("<script>alert('���� ����');window.opener.location.reload(); window.close(); </script>");
		}else{
			out.print("<script>alert('���� ����');window.opener.location.reload();window.close();  </script>");
		}
	}
}