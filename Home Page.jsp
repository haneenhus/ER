

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
ul {
 
  list-style-type: none;
  margin: 0;
  padding: 10px;
  overflow: hidden;
  background-color: white;
 
}
li {
  float: left;
}
li a {
  border-radius: 25px;
  display: block;
  color: Black;
  font-size: 20px;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  margin-left: 20px;
}
li a:hover { 
  background-color: #C5C2C2;
}
           
    </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <%
            
           // session.setAttribute(name, value);
            
            String role = "";
            String ID = request.getParameter("ID");
            String sub = ID.substring(0, 2);
            String password = request.getParameter("password");
            DB.DB_Connection conn = new DB.DB_Connection();
            if ( sub.equalsIgnoreCase("DR")){
                role = "Doctor" ; 
            }else if ( sub.equalsIgnoreCase("NU")){
                role = "Nurse" ; 
            }else if ( sub.equalsIgnoreCase("AD")){
                role = "administrator" ; 
            }
            
            DB.DB_Connection log_in = new DB.DB_Connection();
            boolean result = log_in.login_validation(role , ID, password);
               if (result){
                    %>
        <ul>
            <li><a href="Home Page.jsp">Home</a></li>
            <li style="float:right; margin-right:20px;"><a href="index.jsp">Log Out</a></li> 
         <li style="float:right; margin-right:-20px;"><img  src="3201525-200.png" width="55" height="55"></li>
  
        </ul>
        
        <h1 style="color:white; text-align:center ">Welcome to ER system</h1>
        <table style="margin-right:auto; margin-left:auto; width:800px; height:500px">
            <thead>
                <tr>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                   if (role.equalsIgnoreCase("Doctor")){
                       %> 
                       
                 <tr>
                     <td style="background-color:darkslategray; color:white; text-align: center" ><img src="patients.png" alt="" ><br><br><a style="font-size:1.3em; color: white;" href="DisplayPatientInfo.jsp">Display All Patient</a><br><br></td>
                    <td style="background-color:navy; color:white; text-align: center" >
                        <img src="patients-record.png" alt="" ><br><br><a style="font-size:1.3em; color: white;" href="DisplayAllPatientHealthStatus.jsp"> Patient History Record</a><br><br></td>
                    
                </tr>
                <tr>
                    <td style="background-color:lightgreen; text-align: center"> <img src="ER-Rooms.png" >
                        <br><a style="font-size:1.3em; color: white;" href="DisplayRooms.jsp">Rooms</a><br></td>                    
                </tr>
                 
                       <%
                       
                   }else if (role.equalsIgnoreCase("Nurse")){
                     %> 
                <tr>
                    <td style="background-color:lightblue; color:white; text-align: center" ><img src="Patient-form.png" alt="" ><br><a style="font-size:1.3em; color: white;" href="PatientInfoConformation.jsp">Patient Form</a><br></td>
                    <td style="background-color:lightgreen; color:white; text-align: center" >
                        <img src="Medicl-Form.png" alt="" ><br><a style="font-size:1.3em; color: white;" href="PatientMainTraiageConformation.jsp">Medical History</a></td>
                    
                </tr>
                 <tr>
                     <td style="background-color:darkslategray; color:white; text-align: center" ><img src="patients.png" alt="" ><br><br><a style="font-size:1.3em; color: white;" href="DisplayPatientInfo.jsp">Display All Patient</a><br><br></td>
                    <td style="background-color:navy; color:white; text-align: center" >
                        <img src="patients-record.png" alt="" ><br><br><a style="font-size:1.3em; color: white;" href="DisplayAllPatientHealthStatus.jsp"> Patient History Record</a><br><br></td>
                    
                </tr>
                
                <tr>
                    <td style="background-color:lightgreen; text-align: center"> <img src="ER-Rooms.png"  >
                        <br><a style="font-size:1.3em; color: white;" href="DisplayRooms.jsp">Rooms</a><br><br></td>
                </tr> 
                     <%
                   }else if (role.equalsIgnoreCase("administrator")){
                       
                    %> 
                    
                    <tr>
                    <td style="background-color:lightgreen; text-align: center"> <img src="ER-Rooms.png" alt="" >
                        <br><a style="font-size:1.3em; color: white;" href="AdminRooms.jsp">Rooms</a><br></td>
                    
                </tr>
                    
                    <%
                   }
                   
               } 
                
            %> 
       
            </tbody>
        </table>
    </body>
</html>
