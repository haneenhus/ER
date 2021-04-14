<%-- 
    Document   : AssignPatientToTeam
    Created on : 05/04/2021, 12:53:42 ص
    Author     : haneen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign patient to team</title>
         
    </head>
    <body>
       <%
            String patientID = request.getParameter("id");
            int pID = Integer.parseInt(patientID);
            String doctorID = request.getParameter("doctorID");
            int dID = Integer.parseInt(doctorID);
            DB.DB_Connection conn = new DB.DB_Connection();
            String teamName = request.getParameter("TeamName");
            boolean isAdded = conn.assignPatientToTeam(dID, pID, teamName);
            if (isAdded) {
        %>
        <script>

            alert("this patient is successfully added to"+teamName);
             window.location= "DisplayPatientInfo.jsp?id=<%=doctorID%>";

        </script>
        <%
            } else {
                out.print("Error");

            }
        %> 
    </body>
</html>

