package model;

import java.io.Serializable;

public class CatHealth implements Serializable {
	private int id;
	private String name;
	private int food;
	private int quantity;
	private int kcal;
	private int weight;
	private int date;
	private int month;
	private String birthdate;
	private String memo;
	
	public CatHealth() {}
	public CatHealth(String name, int food, int date, int weight, int month) {
		this.name = name;
		this.food = food;
		this.date = date;
		this.weight = weight;
		this.month = month;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getFood() {
		return food;
	}

	public void setFood(int food) {
		this.food = food;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getKcal() {
		return kcal;
	}

	public void setKcal(int kcal) {
		this.kcal = kcal;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getDate() {
		return date;
	}

	public void setDate(int date) {
		this.date = date;
	}

	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int foodCheck(String str){
		//食べ物foodのカロリー値がnull or enptyでなければintに
		if (str != null && !str.isEmpty()) {
		    // strがnullでなく、かつ空でない場合の処理
		    // ここでstrを安全に使用できる
			return Integer.parseInt(str);
		} else {
		    // strがnullまたは空の場合の処理
			str ="0";
			return Integer.parseInt(str);
		}
	}
	public int calcKcal(int cari, int kurok, int osakana, int oya2) {
		return cari + kurok + osakana + oya2;
	}
}
