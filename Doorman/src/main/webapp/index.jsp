<%@page import="java.security.*"%>
<%@page import="java.sql.*" %>
<%@page import="testito.BCrypt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GuangoLand Login</title>
<link rel="stylesheet" type="text/css" href="/Doorman/GStyle.css">
</head>
<body>

	<%
		String tString = "_Status Bar_";
		String tColor = "orange";
		String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
		String jdbcClassName = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost/test";
		
		
		if(request.getParameter("lAttempt") != null ){
			String username = request.getParameter("uName");
			
		    if( username.matches(regex) ){
				try{
					Class.forName(jdbcClassName);
					
					String userName = "root", passWord = "";
					
					Connection conn = DriverManager.getConnection(dbURL,userName,passWord);
					
					PreparedStatement pStmt = conn.prepareStatement("SELECT eMail,pWord FROM credusers where eMail = ?");
					pStmt.setString(1, username);
					ResultSet anons = pStmt.executeQuery();
					if(anons.next()){
						
						String email = anons.getString("eMail");
						String hashPass = anons.getString("pWord");
						String givenPass = request.getParameter("pWord");
						if (BCrypt.checkpw(givenPass, hashPass)){
							tColor = "green";
							tString = "It matches";
						}
						else{
							tColor = "red";
							tString = "It does not match";
						}
						//tString = email + " " + givenPass;
					}
					else{
						tColor = "yellow";
						tString = "No User Found!";
					}
				}
				catch(ClassNotFoundException | SQLException e){
					tColor = "red";
					tString = "Error during Login";
					e.printStackTrace(response.getWriter());
				}
		    }
		    else{
		    	tColor = "yellow";
		    	tString = "Not a valid username";
		    }
		    	
		}
	
		else if(request.getParameter("nAttempt") != null){
			if( request.getParameter("gName") == null || request.getParameter("gName").equals("")){
				tString = "Fill Moniker Newbie...";
			}
			else{
				String username = request.getParameter("uName");
				String givenName = request.getParameter("gName"); 
				
			    if( username.matches(regex) ){
			    	if(givenName.length() <= 21){
						try{
							Class.forName(jdbcClassName);
							
							String userName = "root", passWord = "";
							
							Connection conn = DriverManager.getConnection(dbURL,userName,passWord);
							
							//CHECK IF ALREADY EXISTS
							String preSql = "SELECT lName FROM credusers where eMail = ?";
							PreparedStatement pStmt = conn.prepareStatement(preSql);
							pStmt.setString(1, username);
							ResultSet ofOne = pStmt.executeQuery();
							//If DNE
							if(!ofOne.next()){
								String hashaThePasha = BCrypt.hashpw(request.getParameter("pWord"), BCrypt.gensalt());
								String sql_2E = "INSERT INTO credusers VALUES (null,'"+givenName+"','Trojan','"+username+"','"+hashaThePasha+"');";
								
								Statement rStmt = conn.createStatement();
								
								if(rStmt.executeUpdate(sql_2E) == 1){
									tColor = "green";
									tString = "Inserted User";
								}
								else{
									tColor = "yellow";
									tString = "User Creation Problem";
								}
							}
							else{
								tColor = "yellow";
								tString = "Username already exists";
							}
						}catch(ClassNotFoundException | SQLException e){
							tColor = "red";
							tString = "Error during Sign-Up";
							e.printStackTrace(response.getWriter());
						}
			    	}
			    	else{
			    		tColor="yellow";
			    		tString="Moniker must be <= 21 characters in length.";
			    	}
			    }
			    else{
			    	tColor="yellow";
			    	tString = "Not a valid username";
			    }
			}	
		}
	
	%>

	<h1>Hello visitor, welcome to GuangoLand!</h1>
	&nbsp;
		<p style="background-color:<%=tColor%>" id="indicator"><%=tString%></p>
	&nbsp;
	<form method="post">
		<p>Username: <input type="text" name="uName" required><span style="color:red">*</span></p>
		<p>Password: <input type="password" name="pWord" required><span style="color:red">*</span></p>
		<p>Moniker: <input type="text" name="gName"><span class="tooltip" id="bluestar">*<span class="tooltiptext">Needed for Sign-Up!</span></span></p>
		<p>
			<input type="submit" value="Login" name="lAttempt">
			<input type="submit" value="Sign-Up" name="nAttempt">
		</p>
	</form>
</body>
</html>