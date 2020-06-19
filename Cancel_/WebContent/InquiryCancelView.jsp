<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<%@ page import="Persistance.*" %>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>���� ���  ���� ����</title>
	<style>
	
body{
	
    margin: 0;
    padding: 0;
}



.content{
    width: 100%;
    height: 30rem;
}

table {
    position: relative;
    left: 50%;
    transform: translateX(-50%);
    margin: 10px 5px;
    border-collapse: collapse;
    width: 70%;
    display:block;
    height:450px;
    overflow:auto;
}

th, td {
    padding: 8px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    border: 1px solid #ddd;
}

thead th{
    background-color: #B7C6EE;
}

tbody tr:hover {background-color:#DEE6F8;}

.bt{
    position: relative;
    left: 15%;
   	width : 100px;
    height : 40px;
    background-color: #0F1D42;
    border: none;
    color: white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px 2px;
    cursor: pointer;
}
.btC{
position: relative;
    left: 36%;
   	width : 150px;
    height : 40px;
    background-color: #0F1D42;
    border: none;
    color: white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 4px 2px;
    cursor: pointer;
}

</style>
</head> 
<body>
        <div class="content">
          	<button class="bt register">���</button>
           	<button class="bt delete">����</button>
			<button class="bt update">����</button>

            <table>
                <thead>
                    <tr>
                       <th class="a">All</th>
						<th class="b">No</th>
						<th class="c">�������</th>
						<th class="d">��������</th>
						<th class="e">�ü���</th>
						<th class="f">�ο�</th>
						<th class="g">����</th>
						<th class="h">����ó</th>
						<th class="i">����ð�</th>
                    </tr>
                </thead>
                <tbody>
					<%
						ArrayList<CancelDTO> list = (ArrayList<CancelDTO>) request.getAttribute("reserve");
								if(list != null) {				
									for (CancelDTO dto : list) {
										pageContext.setAttribute("reserve", dto);
					%>
					 <tr>
                       	<td><input class="ch" type="checkbox"></td>
                       	<td class="id"><%= dto.getReservation_ID() %></td>
                       	<td><%= dto.getReservation_Start()%></td>
						<td><%= dto.getReservation_End()%></td>
						<td><%= dto.getFacilities_Name()%></td>
						<td><%= dto.getHeadCount()%></td>
						<td><%= dto.getReservation_Name() %></td>
						<td><%= dto.getReservation_Phone_Number() %></td>
						<td><%= dto.getReservation_Date() %></td>
                    </tr>
					<%}}%>
                </tbody>
            </table>
          
        </div>



	<script>
	window.addEventListener("load",function(){
		
		const registerbtn = document.querySelector(".register");
		const deletebtn = document.querySelector(".delete");
		const updatebtn = document.querySelector(".update");
		const chbox = document.querySelectorAll(".ch");
		const id = document.querySelectorAll(".id");
		
		registerbtn.addEventListener("click",()=>{
			//���ο� â �ߵ��� �ϱ�
			window.open("RegisterCancelView.jsp","���� ��� ���� ���","width=500, height=400, left=300, top=300");
		})
		
		deletebtn.addEventListener("click",()=>{
			//üũ�ڽ��� üũ�� id��������
			var ids = new Array();
			for(var i=0; i<chbox.length; i++){
				if(chbox[i].checked==true){
					ids.push(id[i].innerText);
				}
			}
			if(ids.length==0){
				alert('������ ������ �����ϼ���');
			}else{
				
				//������Ʈ�ѷ��� ����~!
				var ox = confirm("���� ��� ������ �����Ͻðڽ��ϱ�?");
				if(ox){
					var url = "delete?";
					url += "cnt="+ids.length+"&";
					for(var i=0;i<ids.length;i++){
						url += "id"+i+"="+ids[i]+"&"
					}
					window.location.href = url;
				}
			}
		})
		
		updatebtn.addEventListener("click",()=>{
			// ���ο� â �ߵ��� �ϱ�
			var cnt = 0;
			var up;
			for(var i=0; i<chbox.length; i++){
				if(chbox[i].checked==true){
					cnt++;
					up = id[i].innerText;
				}
			}
			if(cnt==0){
				alert('������ ������ �����ϼ���');
			}
			else if(cnt==1){
				window.open("updateview?id="+up,"���� ��� ���� ����","width=500, height=400, left=300, top=300");
			}else{
				alert('�ϳ��� ����');
			}
		})
		
	})
	</script>
</body>
</html>