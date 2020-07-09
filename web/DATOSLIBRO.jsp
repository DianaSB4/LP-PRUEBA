<%-- 
    Document   : DATOSLIBRO
    Created on : 25/06/2020, 11:50:43 AM
    Author     : crystopher 
--%>

<%@page import="java.sql.*"%>
<%@page import="bd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Libro</title>
    <%!
        String consulta;
        Connection cn;
        PreparedStatement pst;
        ResultSet rs;
    %>
    </head>
    <body>
        
        <table border="3" cellspacing="0" cellpadding="8" bordercolor="dodgerblue" align="center">
            <thead>
                <tr>
                    <th>Nro</th>
                    <th>AUTOR</th>
                    <th>TITULO</th>
                    <th>CANTIDAD</th>
                    <th>AÑO</th>
                    <th>EDITORIAL</th>
                    <th>PAIS</th>
                    <th>PRECIO</th>
                    <th>ESTADO</th>
                </tr>
            </thead>
            <tbody>
                
                <%
                    try {
                            ConectaBd bd = new ConectaBd();
                            cn = bd.getConnection();
                            consulta =
                                    " select l.idlibro, a.Nombre, l.Titulo, l.Cantidad, l.Año , e.Nombre, p.Nombre, l.Precio, l.Estado\n  "
                                    + "from libro  l, autor a, editorial e, pais p\n "      
                                    + "where  l.idautor = a.idautor and l.ideditorial = e.ideditorial and l.idpais = p.idpais\n"
                                    + "group by  l.idlibro, a.Nombre, l.Titulo, l.Cantidad, l.Año, e.Nombre, p.Nombre ";
                                    
                            
                            
                             //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            rs = pst.executeQuery();
                            while(rs.next()){
                            %>  
                            <tr>
                                    <td><% out.print(rs.getString(1));%></td>
                                    <td><% out.print(rs.getString(2));%></td>
                                    <td><% out.print(rs.getString(3));%></td>
                                    <td><% out.print(rs.getString(4));%></td>
                                    <td><% out.print(rs.getString(5));%></td>
                                    <td><% out.print(rs.getString(6));%></td>
                                    <td><% out.print(rs.getString(7));%></td>
                                    <td><% out.print(rs.getString(8));%></td>
                                    <td><% out.print(rs.getString(9));%></td>
                                   
                                </tr>
                             <%   
                            }
                            rs.close();
                            pst.close();
                            cn.close();
                        } catch (Exception e) {
                            out.print("Error SQL");                        
                        }
                    

                %>
                <tr align ='center'>
                <td width="60%" bgcolor="powderblue" COLSPAN = "9"><a href="MENU.jsp"><input type="submit" value="SALIR" name="f_salir" /></a></td>   
                </tr>
            </tbody>
        </table>

        
    </body>
</html>
