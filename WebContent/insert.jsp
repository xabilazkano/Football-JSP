<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert</title>
</head>
<body>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");

		String oracleURL = "jdbc:mysql://localhost/football?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

		Connection conn = DriverManager.getConnection(oracleURL, "dw18", "dw18");

		if (request.getParameter("type").equals("players")) {
			if (request.getParameter("submit") != null) {
				PreparedStatement pst;
				pst = conn.prepareStatement("insert into players values(?,?,?)");

				pst.setString(1, request.getParameter("playerName"));
				pst.setInt(2, Integer.parseInt(request.getParameter("age")));
				pst.setString(3, request.getParameter("team"));

				pst.executeUpdate();
				String redirectURL = "show.jsp?type=players";
				response.sendRedirect(redirectURL);
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
				PreparedStatement pst;
				pst = conn.prepareStatement("insert into teams values(?,?)");

				pst.setString(1, request.getParameter("teamName"));
				pst.setString(2, request.getParameter("coach"));

				pst.executeUpdate();
				String redirectURL = "show.jsp?type=teams";
				response.sendRedirect(redirectURL);
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
				PreparedStatement pst;
				pst = conn.prepareStatement(
						"insert into matches(local_team,local_goals,visitor_team,visitor_goals) values(?,?,?,?)");

				pst.setString(1, request.getParameter("localName"));
				pst.setInt(2, Integer.parseInt(request.getParameter("localGoals")));
				pst.setString(3, request.getParameter("visitorName"));
				pst.setInt(4, Integer.parseInt(request.getParameter("visitorGoals")));

				pst.executeUpdate();
				String redirectURL = "show.jsp?type=matches";
				response.sendRedirect(redirectURL);
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