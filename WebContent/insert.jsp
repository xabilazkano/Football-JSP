<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.zubiri.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert</title>
</head>
<body>
	<%
		Connect connect = new Connect();
		connect.startConnection();

		if (request.getParameter("type").equals("players")) {
			if (request.getParameter("submit") != null) {
				Player player = new Player(request.getParameter("playerName"),
						Integer.parseInt(request.getParameter("age")), request.getParameter("team"));

				if (connect.insertPlayer(player) > 0) {
					String name = player.getName();
	%>
	The player
	<%=name%>
	was correctly added.
	<br>
	<br>
	<a href="show.jsp?type=players">Show players list</a>

	<%
		}
			} else {
	%>
	<form action="insert.jsp" method="get">
		Name <input type="text" name="playerName"><br> <br>
		Age <input type="number" name="age"><br> <br> Team <input
			type="text" name="team"><br> <br> <input
			type="hidden" name="type" value="players"> <input
			type="submit" value="Insert" name="submit"><br>

	</form>



	<%
		}
		} else if (request.getParameter("type").equals("teams")) {
			if (request.getParameter("submit") != null) {
				Team team = new Team(request.getParameter("teamName"), request.getParameter("coach"));
				String teamName = team.getName();
				if (connect.insertTeam(team) > 0) {
	%>
	The team
	<%=teamName%>
	was correctly added.
	<br>
	<br>
	<a href="show.jsp?type=teams">Show teams list</a>
	<%
		}

			} else {
	%>
	<form action="insert.jsp" method="get">
		Name <input type="text" name="teamName"><br> <br>
		Coach <input type="text" name="coach"><br> <br> <input
			type="hidden" name="type" value="teams"> <input type="submit"
			value="Insert" name="submit"><br>

	</form>
	<%
		}
		} else if (request.getParameter("type").equals("matches")) {
			if (request.getParameter("submit") != null) {
				FootballMatch match = new FootballMatch(request.getParameter("localName"),
						request.getParameter("visitorName"), Integer.parseInt(request.getParameter("localGoals")),
						Integer.parseInt(request.getParameter("visitorGoals")));
				String local_team = match.getEquipoLocal();
				String visitor_team = match.getEquipoVisitante();
				if (connect.insertMatch(match) > 0) {
	%>
	The match between
	<%=local_team%>
	and
	<%=visitor_team%>
	was correctly added.
	<br>
	<br>
	<a href="show.jsp?type=matches">Show matches list</a>
	<%
		}

			} else {
	%>
	<form action="insert.jsp" method="get">
		Local team <input type="text" name="localName"><br> <br>
		Local goals <input type="number" name="localGoals"><br> <br>
		Visitor team <input type="text" name="visitorName"><br> <br>
		Visitor goals <input type="number" name="visitorGoals"> <br>
		<br> <input type="hidden" name="type" value="matches"> <input
			type="submit" value="Insert" name="submit"><br>

	</form>
	<%
		}
		}
	%>


</body>
</html>