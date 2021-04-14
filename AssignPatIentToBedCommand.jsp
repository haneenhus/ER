<%-- 
    Document   : 
    Created on : 05/04/2021, 12:49:20 ص
    Author     : haneen
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>      

            body {
                background-image: url("Back3.png");
                background-attachment:fixed;
                background-size:cover;
            }   
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assign Patient to bed</title>
    </head>
    <body>


        <br>
        <br>
        <br>


        <%
            String roomID = request.getParameter("ID");
            String patientID = request.getParameter("patientID");
            String doctorID = request.getParameter("doctorID");
            DB.DB_Connection beds = new DB.DB_Connection();
            ResultSet result = beds.getAvilableBeds(roomID);
        %>
        <table style="margin-right:auto; margin-left:auto; background-color:white; width: 95%; border-collapse: collapse;" border="2" width="2">

            <thead>
                <tr>
                    <th> Bed ID </th>
                    <th> State </th>
                    <th> Room ID </th>
                    <th> Assign </th>
                </tr>
            </thead>
            <tbody>
                <%while (result.next()) {%>
                <tr>
                    <% String bedid = result.getString("bedid");%>
                    <td><%out.print(bedid);%></td>
                    <% String state = result.getString("state");%>
                    <td><%out.print(state);%></td>
                    <% String room = result.getString("roomid");%>
                    <td><%out.print(room);%></td>
                    <td><a href="AssignPatIentToBedCommand.jsp?ID=<%=bedid%>&doctorID=<%=doctorID%>&patientID=<%=patientID%>&room=<%=room%>">Assign</a></td>
                </tr>
                <%}%>                 
            </tbody>

        </table>                 
    </body>
</html>
