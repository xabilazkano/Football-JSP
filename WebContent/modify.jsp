<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");

		String oracleURL = "jdbc:mysql://localhost/football?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

		Connection conn = DriverManager.getConnection(oracleURL, "dw18", "dw18");

		if (request.getParameter("type").equals("players")) {

			if (request.getParameter("submit") != null) {

				PreparedStatement pst;
				pst = conn.prepareStatement("update players set name=?,age=?,team_name=? where name=?;");

				pst.setString(1, request.getParameter("playerName"));
				pst.setInt(2, Integer.parseInt(request.getParameter("age")));
				pst.setString(3, request.getParameter("team"));
				pst.setString(4, request.getParameter("name"));

				pst.executeUpdate();
				String redirectURL = "show.jsp?type=players";
				response.sendRedirect(redirectURL);

			} else {
				String playerName = "";
				String team = "";
				int age = 0;
				String name = request.getParameter("name");

				PreparedStatement pst2 = conn.prepareStatement("select * from players where name='" + name + "';");
				ResultSet result = pst2.executeQuery();

				while (result.next()) {
					playerName = result.getString(1);
					age = result.getInt(2);
					team = result.getString(3);
				}
	%>

	<form action="modify.jsp" method="get">
		Name <input type="text" name="playerName" value="<%=playerName%>"><br>
		<br> Age <input type="number" name="age" value="<%=age%>"><br>
		<br> Team <input type="text" name="team" value="<%=team%>"><br>
		<br> <input type="hidden" name="name" value="<%=playerName%>"><br>
		<input type="hidden" name="type" value="players"> <br> <input
			type="submit" value="Modify" name="submit"><br>

	</form>
	<%
		}
		} else if (request.getParameter("type").equals("teams")) {

			String teamName = "";
			String coach = "";

			if (request.getParameter("submit") != null) {

				PreparedStatement pst;
				pst = conn.prepareStatement("update teams set team_name=?,coach=? where team_name=?;");

				pst.setString(1, request.getParameter("teamName"));
				pst.setString(2, request.getParameter("coach"));
				pst.setString(3, request.getParameter("name"));

				pst.executeUpdate();
				String redirectURL = "show.jsp?type=teams";
				response.sendRedirect(redirectURL);

			} else {

				String name = request.getParameter("name");

				PreparedStatement pst2 = conn
						.prepareStatement("select * from teams where team_name='" + name + "';");
				ResultSet result = pst2.executeQuery();

				while (result.next()) {
					teamName = result.getString(1);
					coach = result.getString(2);
				}
	%>

	<form action="modify.jsp?type=teams" method="get">
		Name <input type="text" name="teamName" value="<%=teamName%>"><br>
		<br> Coach <input type="text" name="coach" value="<%=coach%>"><br>
		<br> <input type="hidden" name="name" value="<%=teamName%>"><br>
		<input type="hidden" name="type" value="teams"> <br> <input
			type="submit" value="Modify" name="submit"><br>

	</form>
	<%
		}
		} else if (request.getParameter("type").equals("matches")) {

			String localName = "";
			String visitorName = "";
			int localGoals = 0;
			int visitorGoals = 0;

			if (request.getParameter("submit") != null) {

				PreparedStatement pst;
				pst = conn.prepareStatement(
						"update matches set local_team=?,local_goals=?,visitor_team=?,visitor_goals=? where id=?;");

				pst.setString(1, request.getParameter("localName"));
				pst.setInt(2, Integer.parseInt(request.getParameter("localGoals")));
				pst.setString(3, request.getParameter("visitorName"));
				pst.setInt(4, Integer.parseInt(request.getParameter("visitorGoals")));
				pst.setInt(5, Integer.parseInt(request.getParameter("id")));

				pst.executeUpdate();
				String redirectURL = "show.jsp?type=matches";
				response.sendRedirect(redirectURL);

			} else {

				String id = request.getParameter("name");

				PreparedStatement pst2 = conn.prepareStatement("select * from matches where id='" + id + "';");
				ResultSet result = pst2.executeQuery();

				while (result.next()) {
					localName = result.getString(2);
					localGoals = result.getInt(3);
					visitorName = result.getString(4);
					visitorGoals = result.getInt(5);
				}
	%>

	<form action="modify.jsp?type=matches" method="get">
		Local team <input type="text" name="localName" value="<%=localName%>"><br>
		<br> Local goals <input type="number" name="localGoals"
			value="<%=localGoals%>"><br> <br> Visitor team <input
			type="text" name="visitorName" value="<%=visitorName%>"><br>
		<br> Visitor goals <input type="number" name="visitorGoals"
			value="<%=visitorGoals%>"> <input type="hidden" name="id"
			value="<%=id%>"><br> <br> <input type="hidden"
			name="type" value="matches"><input type="submit"
			value="Modify" name="submit"><br>

	</form>
	<%
		}
		}
	%>



</body>
</html>