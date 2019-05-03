package com.zubiri;
import java.sql.*;


public class Player {

	private String name;
	private int age;
	private String team;
	
	
	public Player(String name,int age,String team) {
		this.name=name;
		this.age=age;
		this.team=team;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name=name;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {	
		this.age=age;
	}

	public String getTeam() {
		return team;
	}
	
	public void setTeam(String team) {
		this.team=team;
	}
	
	public int insertPlayer(String name,int age,String team) throws ClassNotFoundException, SQLException {
		Connect.startConnection();
		
		PreparedStatement pst;
		pst = Connect.conn.prepareStatement("insert into players values(?,?,?)");

		pst.setString(1, name);
		pst.setInt(2,age );
		pst.setString(3,team );
		return pst.executeUpdate();
		
	}
	
}

