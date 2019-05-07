<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.zubiri.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	text-align: center;
}

a {
	color: #0645AD;
}
</style>
</head>
<body>
	<h3 style="font-weight: normal">
		<%
			Connect connect = new Connect();
			connect.startConnection();
			if (request.getParameter("type").equals("players")) {
				String old_name = "";
				if (request.getParameter("submit") != null) {
					String name = request.getParameter("playerName");
					Player player = new Player(request.getParameter("playerName"),
							Integer.parseInt(request.getParameter("age")), request.getParameter("team"));
					if (connect.modifyPlayer(player, request.getParameter("name")) > 0) {
		%>
		The player
		<%=name%>
		was succesfuly modified <br> <br> <a
			href="show.jsp?type=players">Show players list</a>
		<%
			}

				} else {
					old_name = request.getParameter("name");
		%>

		<form action="modify.jsp" method="get">
			Name <input type="text" name="playerName"><br> <br>
			Age <input type="number" name="age"><br> <br> Team
			<input type="text" name="team"><br> <br> <input
				type="hidden" name="name" value="<%=old_name%>"><br> <input
				type="hidden" name="type" value="players"> <br> <input
				type="submit" value="Modify" name="submit"><br>

		</form>
		<%
			}
			} else if (request.getParameter("type").equals("teams")) {

				if (request.getParameter("submit") != null) {

					String team_name = request.getParameter("teamName");
					Team team = new Team(request.getParameter("teamName"), request.getParameter("coach"));
					if (connect.modifyTeam(team, request.getParameter("old_name")) > 0) {
		%>
		The team
		<%=team_name%>
		has been succesfuly modified. <br> <br> <a
			href="show.jsp?type=teams">Show teams list</a>
		<%
			}

				} else {

					String teamName = request.getParameter("name");
		%>

		<form action="modify.jsp?type=teams" method="get">
			Name <input type="text" name="teamName""><br> <br>
			Coach <input type="text" name="coach""><br> <br> <input
				type="hidden" name="old_name" value="<%=teamName%>"><br>
			<input type="hidden" name="type" value="teams"> <br> <input
				type="submit" value="Modify" name="submit"><br>

		</form>
		<%
			}
			} else if (request.getParameter("type").equals("matches")) {

				if (request.getParameter("submit") != null) {

					FootballMatch match = new FootballMatch(Integer.parseInt(request.getParameter("localGoals")),
							Integer.parseInt(request.getParameter("visitorGoals")));

					if (connect.modifyMatch(match, Integer.parseInt(request.getParameter("id"))) > 0) {
		%>
		The match was succesfuly modified <br> <br> <a
			href="show.jsp?type=matches">Show matches list</a>
		<%
			}

				} else {

					String id = request.getParameter("name");
		%>

		<form action="modify.jsp?type=matches" method="get">
			Local goals <input type="number" name="localGoals"><br>
			<br> Visitor goals <input type="number" name="visitorGoals">
			<input type="hidden" name="id" value="<%=id%>"><br> <br>
			<input type="hidden" name="type" value="matches"><input
				type="submit" value="Modify" name="submit"><br>

		</form>
		<%
			}
			}
		%>

	<br> <br> <a href="Football.jsp">Go back to the main page</a>
	</h3>
</body>
</html>