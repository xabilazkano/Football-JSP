package com.zubiri;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FootballMatch {

	private String equipoLocal;
	private String equipoVisitante;
	private int golesLocal;
	private int golesVisitante;
	

	public FootballMatch(String local_name,String visitor_name,int local_goals, int visitor_goals) {
		this.equipoLocal=local_name;
		this.equipoVisitante=visitor_name;
		this.golesLocal=local_goals;
		this.golesVisitante=visitor_goals;
	}
	
	public FootballMatch(int local_goals,int visitor_goals) {
		this.golesLocal=local_goals;
		this.golesVisitante=visitor_goals;
	}
	
	public String getEquipoLocal() {
		return equipoLocal;
	
        }

	public void setEquipoLocal(String equipoLocal) {
		this.equipoLocal=equipoLocal;
		
	}

	public String getEquipoVisitante() {
		return equipoVisitante;
		
	}

	public void setEquipoVisitante(String equipoVisitante) {
		this.equipoVisitante=equipoVisitante;
		
	}

	public int getGolesLocal() {
		return golesLocal;
		
	}

	public void setGolesLocal(int golesLocal) {
		this.golesLocal=golesLocal;
		
	}

	public int getGolesVisitante() {
		return golesVisitante;
		
	}

	public void setGolesVisitante(int golesVisitante) {
		this.golesVisitante=golesVisitante;
		
	}
	

}