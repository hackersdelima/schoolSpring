<%@page import='java.sql.*'%>
<%
  String id="";
  id = request.getParameter("id");
  
   try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystemdb", "root", "");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet rs = smt.executeQuery("select WardCount from vdccodes where (VDCCode='" + id + "');");
        int i=0;
        %>
        <option  value="" selected>Select ward no.</option>
        <%
        while (rs.next()) {
        	for(i=1;i<=Integer.parseInt(rs.getString(1));i++){
         %>
         <option value="<%=i%>"><%=i %></option>
         <%
        	}
        }
   
   } catch (Exception e) {
        e.printStackTrace();
   }
  
%>