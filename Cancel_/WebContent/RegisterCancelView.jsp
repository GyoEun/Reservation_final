<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head><!-- 
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> -->

<title>���� ���� ���</title>
</head>
<body>
<form action = "register">
	<fieldset>
		<div>
			<label for = "reserveName">������ ����</label><input name = "rName" type = "text" id = "reserveName" required>
		</div>
		<div>
			<label for = "reservePnum">������ ����ó</label><input name = "pnum" type = "text" id = "reservePnum" required>
		</div>
		<div>
			<label for = "facilitiesName">�ü� ��</label><input name = "fName" type = "text" id = "facilitiesName" required>
			<label for = "reserveCnt">���� �ο�</label><input name = "cnt" type = "text" id = "reserveCnt" required>
		</div>
		<div>
			<label>����Ⱓ 
			<input type = "date" name = "start" > 
			~ <input type = "date" name = "end" ></label>
		</div>
		<div>
			<label>����
			<input type="text" name="cNum" id="carNum">
       		<input type="text" name="cName" id="carName"></label>
		</div>
	</fieldset>
	
	  <input type="submit" value="���" class="register">
      <input type="reset" value="���" class="reset">

</form>

</body>
</html>