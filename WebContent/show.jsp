<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show</title>
</head>
<body>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");

		String oracleURL = "jdbc:mysql://localhost/football?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

		Connection conn = DriverManager.getConnection(oracleURL, "dw18", "dw18");

		if (request.getParameter("type").equals("players")) {

			PreparedStatement pst2 = conn.prepareStatement("select * from players;");
			ResultSet result = pst2.executeQuery();
			String text = "";
			while (result.next()) {
				text = text + result.getString(1) + "::" + result.getInt(2) + "::" + result.getString(3)
						+ "  <a href='modify.jsp?name=" + result.getString(1)
						+ "&type=players'>Modify</a>    <a href='delete.jsp?name=" + result.getString(1)
						+ "&type=players'>Delete</a><br>";
			}
	%>
	<%=text%><br>
	<a href="insert.jsp?type=players">Insert a new player</a>

	<%
		} else if (request.getParameter("type").equals("teams")) {

			PreparedStatement pst2 = conn.prepareStatement("select * from teams;");
			ResultSet result = pst2.executeQuery();
			String text = "";
			while (result.next()) {
				text = text + result.getString(1) + "::" + result.getString(2) + "  <a href='modify.jsp?name="
						+ result.getString(1) + "&type=teams'>Modify</a>    <a href='delete.jsp?name="
						+ result.getString(1) + "&type=teams'>Delete</a><br>";
			}
	%>
	<%=text%><br>
	<a href="insert.jsp?type=teams">Insert a new team</a>
	<%
		} else if (request.getParameter("type").equals("matches")) {
			PreparedStatement pst2 = conn.prepareStatement("select * from matches;");
			ResultSet result = pst2.executeQuery();
			String text = "";
			while (result.next()) {
				text = text + result.getString(2) + "::" + result.getInt(3) + "::" + result.getInt(5) + "::"
						+ result.getString(4) + "  <a href='modify.jsp?name=" + result.getInt(1)
						+ "&type=matches'>Modify</a>    <a href='delete.jsp?id=" + result.getInt(1)
						+ "&type=matches'>Delete</a><br>";
			}
	%>
	<%=text%><br>
	<a href="insert.jsp?type=matches">Insert a new match</a>

	<%
		}
	%>
 	<br><br><a href="Football.jsp">Go back</a>
</body>
</html>