package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.CatHealth;

public class CatHealthDao {
	private Connection db;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private void connect() throws NamingException, SQLException {
		Context context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/jsp");
		this.db =ds.getConnection();
	}
	private void disconnect() {
		
		try {
			if(rs != null) {
				rs.close();
			}
			if(ps != null) {
				ps.close();
			}
			if(db != null) {
				db.close();
			}	
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
	}
	public List<CatHealth> findAll(){
		List<CatHealth> list = new ArrayList<>();
		
		try {
			this.connect();
			ps = db.prepareStatement("SELECT * FROM chi_gumi");
			rs = ps.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				int food = rs.getInt("food");
				int date = rs.getInt("day");
				int weight = rs.getInt("weight");
				int month = rs.getInt("month");
				list.add(new CatHealth(name,food,date,weight,month));
			}
		} catch (NamingException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}finally {
			this.disconnect();
		}
		return list;
	}
	public List<CatHealth> findGugu(){
		List<CatHealth> list = new ArrayList<>();
		
		try {
			this.connect();
			ps = db.prepareStatement("SELECT name,day,month, SUM(food) as food, MAX(weight) as weight FROM chi_gumi WHERE name = 'ぐぐ' GROUP BY day;");
			rs = ps.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				int food = rs.getInt("food");
				int date = rs.getInt("day");
				int weight = rs.getInt("weight");
				int month = rs.getInt("month");
				list.add(new CatHealth(name,food,date,weight,month));
			}
		} catch (NamingException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}finally {
			this.disconnect();
		}
		return list;
	}
	public List<CatHealth> findChichi(){
		List<CatHealth> list = new ArrayList<>();
		
		try {
			this.connect();
			ps = db.prepareStatement("SELECT name,day,month, SUM(food) as food, MAX(weight) as weight FROM chi_gumi WHERE name = 'ちっち' GROUP BY day;");
			rs = ps.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				int food = rs.getInt("food");
				int date = rs.getInt("day");
				int weight = rs.getInt("weight");
				int month = rs.getInt("month");
				list.add(new CatHealth(name,food,date,weight,month));
			}
		} catch (NamingException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}finally {
			this.disconnect();
		}
		return list;
	}
	public void insertOne(CatHealth catHealth) {
		try {
			this.connect();
			ps = db.prepareStatement("INSERT INTO chi_gumi(name,day,food,weight,month) VALUES(?,?,?,?,?)");
			ps.setString(1, catHealth.getName());
			ps.setInt(2, catHealth.getDate());
			ps.setInt(3, catHealth.getFood());
			ps.setInt(4, catHealth.getWeight());
			ps.setInt(5, catHealth.getMonth());
			ps.execute();
			
		} catch (NamingException | SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}finally {
			this.disconnect();
		}
	}
}
