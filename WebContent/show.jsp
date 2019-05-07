<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.zubiri.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show</title>
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
				String text = connect.showPlayers();
		%>
		<%=text%><br> <a href="insert.jsp?type=players">Insert a new
			player</a>

		<%
			} else if (request.getParameter("type").equals("teams")) {
				String text = connect.showTeams();
		%>
		<%=text%><br> <a href="insert.jsp?type=teams">Insert a new
			team</a>



		<%
			} else if (request.getParameter("type").equals("matches")) {
				String text = connect.showMatches();
		%>
		<%=text%><br> <a href="insert.jsp?type=matches">Insert a new
			match</a>

		<%
			}
		%>
		<br> <br> <a href="Football.jsp">Go back</a>
	</h3>
</body>
</html>