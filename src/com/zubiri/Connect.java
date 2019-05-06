package com.zubiri;

import java.sql.*;

public class Connect {

	public Connection conn = null;

	public void startConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");

		String oracleURL = "jdbc:mysql://localhost/football?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

		conn = DriverManager.getConnection(oracleURL, "dw18", "dw18");
	}

	public int insertPlayer(String name, int age, String team) throws ClassNotFoundException, SQLException {

		PreparedStatement pst;
		pst = conn.prepareStatement("insert into players values(?,?,?)");

		pst.setString(1, name);
		pst.setInt(2, age);
		pst.setString(3, team);
		return pst.executeUpdate();

	}

	public int insertTeam(String name, String coach) throws SQLException, ClassNotFoundException {

		PreparedStatement pst;
		pst = conn.prepareStatement("insert into teams values(?,?)");

		pst.setString(1, name);
		pst.setString(2, coach);
		return pst.executeUpdate();
	}

	public int insertMatch(String local_name, String visitor_name, int local_goals, int visitor_goals)
			throws SQLException, ClassNotFoundException {

		PreparedStatement pst;
		pst = conn.prepareStatement(
				"insert into matches(local_team,local_goals,visitor_team,visitor_goals) values(?,?,?,?)");

		pst.setString(1, local_name);
		pst.setInt(2, local_goals);
		pst.setString(3, visitor_name);
		pst.setInt(4, visitor_goals);
		return pst.executeUpdate();

	}

	public int deletePlayer(String playerName) throws SQLException {
		PreparedStatement pst;

		pst = conn.prepareStatement("delete from players where name=?;");

		pst.setString(1, playerName);

		return pst.executeUpdate();
	}

	public int deleteTeam(String teamName) throws SQLException {
		PreparedStatement pst;

		pst = conn.prepareStatement("delete from teams where team_name=?;");

		pst.setString(1, teamName);

		return pst.executeUpdate();
	}

	public int deleteMatch(int id) throws SQLException {
		PreparedStatement pst;

		pst = conn.prepareStatement("delete from matches where id=?;");

		pst.setInt(1, id);

		return pst.executeUpdate();

	}

	public int modifyPlayer(String new_name, String age, String team, String name) throws SQLException {
		PreparedStatement pst;
		pst = conn.prepareStatement("update players set name=?,age=?,team_name=? where name=?;");

		pst.setString(1, new_name);
		pst.setString(2, age);
		pst.setString(3, team);
		pst.setString(4, name);

		return pst.executeUpdate();
	}

	public int modifyTeam(String team_name, String coach, String old_name) throws SQLException {

		PreparedStatement pst;
		pst = conn.prepareStatement("update teams set team_name=?,coach=? where team_name=?;");

		pst.setString(1, team_name);
		pst.setString(2, coach);
		pst.setString(3, old_name);

		return pst.executeUpdate();
	}

	public int modifyMatch(String local_goals, String visitor_goals, String id) throws SQLException {

		PreparedStatement pst;
		pst = conn.prepareStatement("update matches set local_goals=?,visitor_goals=? where id=?;");

		pst.setString(1, local_goals);
		pst.setString(2, visitor_goals);
		pst.setString(3, id);

		return pst.executeUpdate();
	}

	public String showPlayers() throws SQLException {

		PreparedStatement pst2 = conn.prepareStatement("select * from players;");
		ResultSet result = pst2.executeQuery();
		String text = "";
		while (result.next()) {
			text = text + result.getString(1) + "::" + result.getInt(2) + "::" + result.getString(3)
					+ "  <a href='modify.jsp?name=" + result.getString(1)
					+ "&type=players'>Modify</a>    <a href='delete.jsp?name=" + result.getString(1)
					+ "&type=players'>Delete</a><br>";
		}
		return text;
	}

	public String showTeams() throws SQLException {
		PreparedStatement pst2 = conn.prepareStatement("select * from teams;");
		ResultSet result = pst2.executeQuery();
		String text = "";
		while (result.next()) {
			text = text + result.getString(1) + "::" + result.getString(2) + "  <a href='modify.jsp?name="
					+ result.getString(1) + "&type=teams'>Modify</a>    <a href='delete.jsp?name=" + result.getString(1)
					+ "&type=teams'>Delete</a><br>";
		}
		return text;
	}
	
	public String showMatches() throws SQLException {
		PreparedStatement pst2 = conn.prepareStatement("select * from matches;");
		ResultSet result = pst2.executeQuery();
		String text = "";
		while (result.next()) {
			text = text + result.getString(2) + "::" + result.getInt(3) + "::" + result.getInt(5) + "::"
					+ result.getString(4) + "  <a href='modify.jsp?name=" + result.getInt(1)
					+ "&type=matches'>Modify</a>    <a href='delete.jsp?id=" + result.getInt(1)
					+ "&type=matches'>Delete</a><br>";
		}
		return text;
	}
}
