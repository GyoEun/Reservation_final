<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="Persistance.*"%>
<!DOCTYPE html>
<html>
<head>
<title>���� ���� ����</title>
</head>
<body>
	<%
		ReservationDTO dto = (ReservationDTO) request.getAttribute("dto");
		pageContext.setAttribute("dto", dto);
	
		String ri = dto.getReservation_ID();
		out.println(ri);
	%>
	
	
	<form action = "update">
	<fieldset>
	   <div>
                <label>������ ReservationName</label>
                <input name="ri" type="text" id="reseveName"  value='<%= ri %>' readonly>
            </div>
	
		<div>
			<label for = "reserveName">������ ����</label><input name = "rName" type = "text" id = "reserveName" value = '<%=dto.getReservation_Name() %>'>
		</div>
		<div>
			<label for = "reservePnum">������ ����ó</label><input name = "pnum" type = "text" id = "reservePnum" value='<%=dto.getReservation_Phone_Number()%>'>
		</div>
		<div>
			<label for = "facilitiesName">�ü� ��</label><input name = "fName" type = "text" id = "facilitiesName" value='<%=dto.getFacilities_Name()%>'>
			<label for = "reserveCnt">���� �ο�</label><input name = "cnt" type = "text" id = "reserveCnt" value='<%=dto.getHeadCount()%>'>
		</div>
		<div>
			<label>����Ⱓ 
			<input type = "date" name = "start" id = "startD" value='<%=dto.getReservation_Start()%>'>
			~ <input type = "date" name = "end" id = "endD" value=<%=dto.getReservation_End()%>></label>
		</div>
		<div>
			<label>����
			<input type="text" name="cNum" id="carNum" <%=dto.getCar_Num()%>>
       		<input type="text" name="cName" id="carName"<%=dto.getCar_Name()%>></label>
		</div>
	</fieldset>
	
	  <input type="submit" value="����" class="update">
      <input type="reset" value="���" class="reset">

</form>
</body>
</html>