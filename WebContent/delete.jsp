<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete</title>
</head>
<body>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");

		String oracleURL = "jdbc:mysql://localhost/football?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

		Connection conn = DriverManager.getConnection(oracleURL, "dw18", "dw18");

		if (request.getParameter("type").equals("players")) {
			PreparedStatement pst;

			pst = conn.prepareStatement("delete from players where name=?;");

			pst.setString(1, request.getParameter("name"));

			pst.executeUpdate();

			String redirectURL = "show.jsp?type=players";
			response.sendRedirect(redirectURL);
		}

		else if (request.getParameter("type").equals("teams")) {
			PreparedStatement pst;

			pst = conn.prepareStatement("delete from teams where team_name=?;");

			pst.setString(1, request.getParameter("name"));

			pst.executeUpdate();

			String redirectURL = "show.jsp?type=teams";
			response.sendRedirect(redirectURL);
		}

		else if (request.getParameter("type").equals("matches")) {
			PreparedStatement pst;

			pst = conn.prepareStatement("delete from matches where id=?;");

			pst.setString(1, request.getParameter("id"));

			pst.executeUpdate();

			String redirectURL = "show.jsp?type=matches";
			response.sendRedirect(redirectURL);
		}
	%>
</body>
</html>