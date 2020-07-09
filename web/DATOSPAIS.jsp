<%-- 
    Document   : DATOSPAIS
    Created on : 25/06/2020, 11:10:26 AM
    Author     : crystopher 
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Pais</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_Accion;
            String s_idpais;

        %>
    </head>
    <body>
        <table border="3" cellspacing="0" cellpadding="8" bordercolor="dodgerblue" align="center">
            <thead>
                <th>Nombre</th>
                <th>ESTADO</th>
                
            </thead>

        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                consulta= " Select nombre,estado "
                        + " from pais ORDER BY nombre ASC";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                
                while (rs.next()) {    
                    %>
                    <tr>
                        <td><%out.print(rs.getString(1));%></td>
                        <td><%out.print(rs.getString(2));%></td>
                  
                    </tr>                    
                    <%
                    }
            }catch(Exception e){
                out.print("Error SQL");
            }
        
        %>
                <tr align ='center'>
                <td width="60%" bgcolor="powderblue" COLSPAN = "3"><a href="MENU.jsp"><input type="submit" value="SALIR" name="f_salir" /></a></td>   
                </tr>
        </table>
    </body>
</html>