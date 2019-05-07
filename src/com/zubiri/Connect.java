package com.zubiri;

import java.sql.*;

public class Connect {

	public Connection conn = null;

	public void startConnection() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");

		String oracleURL = "jdbc:mysql://localhost/football?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

		conn = DriverManager.getConnection(oracleURL, "dw18", "dw18");
	}

	public int insertPlayer(Player player) throws ClassNotFoundException, SQLException {

		PreparedStatement pst;
		pst = conn.prepareStatement("insert into players values(?,?,?)");

		pst.setString(1, player.getName());
		pst.setInt(2, player.getAge());
		pst.setString(3, player.getTeam());
		return pst.executeUpdate();

	}

	public int insertTeam(Team team) throws SQLException, ClassNotFoundException {

		PreparedStatement pst;
		pst = conn.prepareStatement("insert into teams values(?,?)");

		pst.setString(1, team.getName());
		pst.setString(2, team.getCoach());
		return pst.executeUpdate();
	}

	public int insertMatch(FootballMatch match)
			throws SQLException, ClassNotFoundException {

		PreparedStatement pst;
		pst = conn.prepareStatement(
				"insert into matches(local_team,local_goals,visitor_team,visitor_goals) values(?,?,?,?)");

		pst.setString(1, match.getEquipoLocal());
		pst.setInt(2, match.getGolesLocal());
		pst.setString(3, match.getEquipoVisitante());
		pst.setInt(4, match.getGolesVisitante());
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

	public int modifyPlayer(Player player, String old_name) throws SQLException {
		PreparedStatement pst;
		pst = conn.prepareStatement("update players set name=?,age=?,team_name=? where name=?;");

		pst.setString(1, player.getName());
		pst.setInt(2, player.getAge());
		pst.setString(3, player.getTeam());
		pst.setString(4, old_name);

		return pst.executeUpdate();
	}

	public int modifyTeam(Team team,String old_name) throws SQLException {

		PreparedStatement pst;
		pst = conn.prepareStatement("update teams set team_name=?,coach=? where team_name=?;");

		pst.setString(1, team.getName());
		pst.setString(2, team.getCoach());
		pst.setString(3, old_name);

		return pst.executeUpdate();
	}

	public int modifyMatch(FootballMatch match,int id) throws SQLException {

		PreparedStatement pst;
		pst = conn.prepareStatement("update matches set local_goals=?,visitor_goals=? where id=?;");

		pst.setInt(1, match.getGolesLocal());
		pst.setInt(2, match.getGolesVisitante());
		pst.setInt(3, id);

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
