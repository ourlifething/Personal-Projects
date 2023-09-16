package model;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.Locale;

public class Calender {
	// LocalDate インスタンスを取得
	LocalDate today = LocalDate.now();
	
	public int getMonth() {
		// 月を取得
		return today.getMonthValue();
	}
	public int getDay() {
		// 日を取得
		return today.getDayOfMonth();
	}
	public String getWeek() {
		// 曜日を取得 (DayOfWeek 列挙型を使用)
		DayOfWeek dayOfWeek = today.getDayOfWeek();
		String dayOfWeekName = dayOfWeek.getDisplayName(TextStyle.FULL, Locale.JAPANESE);
		return dayOfWeekName;
	}
	public int getYear() {
		// 現在の年を取得
		return LocalDate.now().getYear();
	}
	
	public DayOfWeek getFirstDayOfWeek(int year,int month,int day) {
		// 月の初日の曜日を取得するメソッド
		LocalDate firstDayOfMonth = LocalDate.of(year, month, day);
		return firstDayOfMonth.getDayOfWeek();
	}
	public int getLastDayOfMonth(int year, int month) {
		// 月の最終日を取得するメソッド
		LocalDate lastDayOfMonth = LocalDate.of(year, month, 1)
                .plusMonths(1)
                .minusDays(1);
        return lastDayOfMonth.getDayOfMonth();
	}
	
	public DayOfWeek getWeekFirst() {
		int year = getYear();
		int month = getMonth();
		int day = 1;
		return getFirstDayOfWeek(year, month, day);
	}

	public int getLastDay() {
		int year = getYear();
		int month = getMonth();
		return getLastDayOfMonth(year, month);
	}
	

}


	



