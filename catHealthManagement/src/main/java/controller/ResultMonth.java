package controller;

import java.io.IOException;
import java.time.DayOfWeek;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CatHealthDao;
import model.Calender;
import model.CatHealth;

@WebServlet("/ResultMonth")
public class ResultMonth extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String month = request.getParameter("intvalue");       
		String thisyear = request.getParameter("yearvalue");
		int thisMonth = Integer.parseInt(month);               
		int year = Integer.parseInt(thisyear);
		//System.out.println("doget:"+thisMonth);  
		
		//年をまたぐ処理
		if(thisMonth < 1) {
			year--; 
			thisMonth += 12;
			System.out.println("+した："+thisMonth);
		 }else if(thisMonth > 12) {
			year++; 
			thisMonth -= 12;
		 }
		//System.out.println(year);
		request.setAttribute("year", year);
		//System.out.println("debag: doget inn"+ thisMonth); 
		Calender calender = new Calender();
		int kongetu = calender.getMonth(); //今月を作成
		Integer intMonth = 0; //今月より前か後かを０１で判定、初期値０
		if(thisMonth > kongetu) {//受け取ったthisMonthが今月よりも小さい場合	
			request.setAttribute("intMonth", intMonth);
			//System.out.println("> 0:"+thisMonth); 
		}else{
			intMonth = 1;
			request.setAttribute("intMonth", intMonth);
			//System.out.println("< 1:"+thisMonth);
		}
		request.setAttribute("thisMonth", thisMonth);
		System.out.println("thismonth"+thisMonth);
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/view/resultMonth.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("debug log:doPost in "); //ログ
		Calender calender = new Calender();//カレンダーインスタンス化
		DayOfWeek firstWeek = calender.getWeekFirst();//今月1日の曜日を取得
		int lastDay = calender.getLastDay();//今月の末日を取得
		int today = calender.getDay();//今日の日を取得
		int month = calender.getMonth();
		int year = calender.getYear();//年を取得
		System.out.println(today);//ログ；今日の日
		request.setAttribute("today",today);
		request.setAttribute("firstWeek",firstWeek);
		request.setAttribute("lastDay", lastDay);
		request.setAttribute("year", year);
		
		String selectName = request.getParameter("名前");
		System.out.println(selectName);
		String caricari = request.getParameter("カリカリ");
		String kurokan = request.getParameter("黒缶");
		String osakanaseikatsu = request.getParameter("おさかな生活");
		String oyatsu = request.getParameter("おやつ");
		String memo = request.getParameter("メモ");
		String weight = request.getParameter("体重G");
	
		int weightInt = 0;
		if(weight.isEmpty()) {
			weight = "0";
			weightInt = Integer.parseInt(weight);//weightが空の場合
			
		}else {
			weightInt = Integer.parseInt(weight);
		}
		
		CatHealth catHealth = new CatHealth();
		int cari = catHealth.foodCheck(caricari);	
		int kurok = catHealth.foodCheck(kurokan);
		int osakana = catHealth.foodCheck(osakanaseikatsu);
		int oya2 = catHealth.foodCheck(oyatsu);
		
		int foodKcal = catHealth.calcKcal(cari,kurok,osakana,oya2);//カロリー集計
		System.out.println(foodKcal);
		
		CatHealth cathealth = new CatHealth(selectName,foodKcal,today,weightInt,month);//インスタンス化
		
		CatHealthDao catdao = new CatHealthDao();
		if(selectName.isEmpty()) {
			request.setAttribute("errorMsg", "ペットが選択されてません");
			RequestDispatcher ds = request.getRequestDispatcher("WEB-INF/view/main.jsp");
			ds.forward(request, response);
		}else {
			catdao.insertOne(cathealth); //データベースに書き込み（名前、カロリー集計、日付（操作した日、月）体重、メモ）
		}
		
		List<CatHealth> dataGugu = catdao.findGugu();//ぐぐの情報を日にち月別に取得
		System.out.println("dataGugu"+dataGugu);
		if(dataGugu != null) {
			HttpSession session = request.getSession();
			session.setAttribute("dataGugu",dataGugu);
		}
		List<CatHealth> dataChichi = catdao.findChichi();//ちっちの情報を日にち月別に取得
		System.out.println("dataChichi"+dataChichi);
		if(dataChichi != null) {
			HttpSession session = request.getSession();
			session.setAttribute("dataChichi",dataChichi);
		}
		
		RequestDispatcher ds = request.getRequestDispatcher("WEB-INF/view/resultMonth.jsp");
		ds.forward(request, response);
		System.out.println("debug:doPost/ResultMonth");
	}

}
