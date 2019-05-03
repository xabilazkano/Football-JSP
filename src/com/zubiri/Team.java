package com.zubiri;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Team {

	private String name;
	private String coach;


	public Team(String name,String coach) {
		this.name=name;
		this.coach=coach;
	
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCoach() {
		return coach;
	}

	public void setCoach(String coach) {
		this.coach = coach;
	}

	

	public int insertTeam(String name, String coach) throws SQLException, ClassNotFoundException {
		Connect.startConnection();

		PreparedStatement pst;
		pst = Connect.conn.prepareStatement("insert into teams values(?,?)");

		pst.setString(1, name);
		pst.setString(2, coach);
		return pst.executeUpdate();
	}

}
