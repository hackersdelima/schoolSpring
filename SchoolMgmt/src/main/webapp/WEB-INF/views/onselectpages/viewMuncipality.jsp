<%@page import='java.sql.*'%>

<%
System.out.println("reached viewMuncipality");
  String id="";
  id = request.getParameter("id");
   try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/schoolmanagementsystemdb", "root", "");
        Statement smt = con.createStatement(); //Create Statement to interact
        ResultSet rs = smt.executeQuery("select * from vdccodes where (DistrictCode='" + id + "');");
        %>
        <option value="" selected>Select muncipality or VDC</option>
        <%
        while (rs.next()) {
         %>
         <option value="<%=rs.getString(1)%>"><%=rs.getString(2) %></option>
         <%
          
        }
   
   } catch (Exception e) {
        e.printStackTrace();
   }
  
%>