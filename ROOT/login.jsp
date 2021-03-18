<%@ page import="java.sql.*"%>

<%
 String userName = request.getParameter("userName"); 
 
 String password = request.getParameter("password"); 
 
 Class.forName ("com.mysql.cj.jdbc.Driver"); 
 Connection con = DriverManager.getConnection("jdbc:mysql://rds-joonhyun-prod-db.cxyj6fu6anpi.ap-northeast-1.rds.amazonaws.com:3306/test_db?useUnicode=true&characterEncoding=utf8", "admin", "starlabs!");
 Statement st = con.createStatement(); 
 ResultSet rs; 
 rs = st.executeQuery("select * from USER where username='" + userName + "' and password='" + password + "'");
	if (rs.next()) 
		{ 
			session.setAttribute("userid", userName); 
			response.sendRedirect("success.jsp"); 
		} 
	else 
		{ 
			out.println("Invalid password <a href='index.jsp'>try again</a>"); 
} 
%>
