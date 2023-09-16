<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.time.DayOfWeek, java.util.*"%>
<%
Integer lastday = (Integer)request.getAttribute("lastDay");//月の最終日を取得 1
DayOfWeek firstWeek = (DayOfWeek)request.getAttribute("firstWeek");//月最初の曜日を取得 1
Integer today = (Integer)request.getAttribute("today");//今日に日を取得 1
Integer year = (Integer)request.getAttribute("year"); //1
Calender calender = new Calender();
//Integer lastMonth = (Integer)request.getAttribute("lastMonth");
//Integer nextMonth = (Integer)request.getAttribute("nextMonth");
Integer thisMonth = (Integer)request.getAttribute("thisMonth");
Integer intMonth = (Integer)request.getAttribute("intMonth");
List<CatHealth> dataGugu = (List<CatHealth>)session.getAttribute("dataGugu");
List<CatHealth> dataChichi = (List<CatHealth>)session.getAttribute("dataChichi");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="css/main.css">
<title>ペット健康の集計結果</title>
</head>

<body>

<div class="container">
<nav>
  <ul>
    <li>
   
    <%if(thisMonth != null && intMonth != 0){ %> <!-- 1の時 -->
      <%int month = thisMonth-1; %>
      <a class="" href="ResultMonth?intvalue=<%=month %>&yearvalue=<%=year%>">
        <span>&laquo;</span>
      </a>
      <%}else if(thisMonth != null){ %><!-- 0の時 -->
      <%int month = thisMonth-1; %>
      <a class="" href="ResultMonth?intvalue=<%=month %>&yearvalue=<%=year%>">
        <span>&laquo;</span>
      </a>
    <% }else{ %>
		<%int month = calender.getMonth()-1; %>
    	<a class="" href="ResultMonth?intvalue=<%=month %>&yearvalue=<%=year%>"><!-- 1 -->
        <span>&laquo;</span>
    	</a>
    <%} %>
    </li>
    <%if (thisMonth != null){ %>
    	<li><h2>CAT HEALTH --<%=thisMonth %>--</h2></li>
    <% }else{ %>
    	<%int month = calender.getMonth(); %>
    	<li><h2> CAT HEALTH --<%=month %>--</h2></li> <!-- 1 -->
    <%} %>
    <li>
    
    <%if(thisMonth != null && intMonth != 0){ %>
    <%int month = thisMonth+1; %>
      <a class="" href="ResultMonth?intvalue=<%=month %>&yearvalue=<%=year%>">
        <span>&raquo;</span>
      </a>
      <%} else if(thisMonth != null){ %>
      <%int month = thisMonth+1; %>
       <a class="" href="ResultMonth?intvalue=<%=month %>&yearvalue=<%=year%>">
        <span>&raquo;</span>
      </a>
    <%}else{ %>
		<%int month = calender.getMonth()+1; %>
    	<a class="" href="ResultMonth?intvalue=<%=month %>&yearvalue=<%=year%>"><!-- 1 -->
        <span>&raquo;</span>
    	</a>
    <%} %>
    </li>
  </ul>
</nav>
<p><%=year %></p>
</div>


<div class="container px-5 my-5">
<table>
<tr class="tr">
<th class="th">sun</th>
<th class="th">mon</th> 
<th class="th">tue</th>
<th class="th">wed</th>
<th class="th">tur</th>
<th class="th">fri</th>
<th class="th">sat</th>
</tr>

<%if(thisMonth != null){ %>
<% lastday = calender.getLastDayOfMonth(year,thisMonth); %> <!-- 最終日を取得 -->
<% firstWeek = calender.getFirstDayOfWeek(year,thisMonth,1); %><!-- １日の曜日を取得 -->

	<% for (int i = 0; i < 6; i++) { %>
		<tr>
			<% for (int j=0; j < 7; j++) { %>
				<td>
					<% int day = j+(i*7)+1;  %>
						<% if (day > firstWeek.getValue()){ %>
						<% if (day > lastday+firstWeek.getValue()) { %>
							&nbsp; <!-- 日付が月の最終日を超えた場合は空白を表示 -->
						<% } else { %>
						<%int resultDay = day-firstWeek.getValue(); %> <!-- 日付を表示 -->
							<%=resultDay %><br>
							<%if (dataGugu != null){ %>
								<%for(CatHealth gugu :dataGugu){%>
									<%if(resultDay == gugu.getDate() && thisMonth == gugu.getMonth()){ %>
										<%=gugu.getName() %><br>
										<small><%=gugu.getFood() +"Kcal" %></small><br>
										<%if (gugu.getWeight() != -1 && gugu.getWeight() != 0){%>
											<small><%=gugu.getWeight() +"kg" %></small><br>
										<%} %>
										<%} %>
									<%} %>
								<%} %>
								<%if (dataChichi != null){ %><!-- chichi -->
								<%for(CatHealth chichi :dataChichi){%>
									<%if(resultDay == chichi.getDate() && thisMonth == chichi.getMonth()){ %>
										<%=chichi.getName() %><br>
										<small><%=chichi.getFood() +"Kcal" %></small><br>
										<%if (chichi.getWeight() != -1 && chichi.getWeight() != 0){%>
											<small><%=chichi.getWeight() +"kg" %></small><br>
										<%} %>
										<%} %>
									<%} %>
								<%} %>
							<%} %>
						<%} else { %>
						&nbsp;
					<%} %>
				</td>
			 <%} %>
		 </tr>
	 <% } %>
<% }else{ %>

	<% for (int i = 0; i < 6; i++) { %><!-- 1 this month がnullなら-->
		<tr>
			<% for (int j=0; j < 7; j++) { %>
				<td>
					<% int day = j+(i*7)+1;  %>
						<% if (day > firstWeek.getValue()){ %>
						<% if (day > lastday+firstWeek.getValue()) { %>
							&nbsp; <!-- 日付が月の最終日を超えた場合は空白を表示 -->
						<% } else { %>
						<%int resultDay = day-firstWeek.getValue(); %> <!-- 日付を表示 -->
							<%=resultDay %><br>
							<%for(CatHealth gugu :dataGugu){%>
								<%if(resultDay == gugu.getDate()){ %>
									<%=gugu.getName() %><br>
									<small><%=gugu.getFood() +"Kcal" %></small><br>
									<%if (gugu.getWeight() != -1 && gugu.getWeight() != 0){%>
										<small><%=gugu.getWeight() +"kg" %></small><br>
									<%} %>
								<%} %>
								<%} %>
								<%for(CatHealth chichi :dataChichi){%><!-- chichi -->
								<%if(resultDay == chichi.getDate()){ %>
									<%=chichi.getName() %><br>
									<small><%=chichi.getFood() +"Kcal" %></small><br>
									<%if (chichi.getWeight() != -1 && chichi.getWeight() != 0){%>
										<small><%=chichi.getWeight() +"kg" %></small><br>
									<%} %>
								<%} %>
								<%} %>
							<%} %>
					<%} else { %>
						&nbsp;
					<%} %>
				</td>
			 <%} %>
		 </tr>
	 <% } %>
 
 <%} %>
</table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>