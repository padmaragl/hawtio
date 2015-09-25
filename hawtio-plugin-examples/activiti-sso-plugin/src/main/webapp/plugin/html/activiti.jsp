<%@ page import="java.io.*" 
         import="java.util.*" 
%>
<% out.println("System User (karaf.name) is : " + System.getProperty("karaf.name")); %>
<% out.println("<br/>Remote User is : " + request.getRemoteUser()); %>
<% out.println("<br/>User Principal is : " + request.getUserPrincipal()); %>
<% out.println("<br/>Session is : " + session.toString()); %>
<% out.println("<br/>Request is : " + request); %>

<%
   Enumeration enames;
   String title;

   // Print the request headers

   out.println("<br/> ***** Request Headers *****<br/>");

   
   enames = request.getHeaderNames();
   while (enames.hasMoreElements()) {
      String name = (String) enames.nextElement();
      String value = request.getHeader(name);
      out.println("name:" + name + ", value:" + value + "<br/>");
   }
   

   // Print the session attributes

   out.println("***** Session Attributes *****<br/>");

   enames = session.getAttributeNames();
   while (enames.hasMoreElements()) {
      String name = (String) enames.nextElement();
      String value = "" + session.getAttribute(name);
      out.println("name:" + name + ", value:" + value + "<br/>");
   }
   //out.println(createTable(map, "Session Attributes"));

%>
<div ng-controller="Core.AppController">
    <table ng-show="loggedIn()">
        <tr>
            <td>Username</td>
            <td>{{getUsername()}}</td>
        </tr>
    </table>
</div>