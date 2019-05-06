<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.zubiri.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
	<%
		Connect connect = new Connect();
		connect.startConnection();
		if (request.getParameter("type").equals("players")) {

			String name = request.getParameter("name");
			if (connect.deletePlayer(name) > 0) {
	%>
	The player
	<%=name%>
	was correctly deleted
	<br>
	<br>
	<a href="show.jsp?type=players">Show players list </a>
	<%
		}

		} else if (request.getParameter("type").equals("teams")) {
			String team_name = request.getParameter("name");
			if (connect.deleteTeam(team_name) > 0) {
	%>
	The team
	<%=team_name%>
	was correctly deleted
	<br>
	<br>
	<a href="show.jsp?type=teams">Show teams list</a>
	<%
		}

		}

		else if (request.getParameter("type").equals("matches")) {
			if (connect.deleteMatch(Integer.parseInt(request.getParameter("id"))) > 0) {
	%>
	The match was correctly deleted
	<br>
	<br>
	<a href="show.jsp?type=matches">Show matches list</a>
	<%
		}

		}
	%>
</body>
</html>