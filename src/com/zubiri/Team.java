package com.zubiri;


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

	

	

}
