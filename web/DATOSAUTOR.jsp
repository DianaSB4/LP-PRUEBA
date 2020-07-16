<%-- 
    Document   : DATOSAUTOR
    Created on : 25/06/2020, 10:19:59 AM
    Author     : crystopher 
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos autor</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idautor;
            String s_nombre;
            String s_fechan;

        %>
    </head>
    <body>
         <form name="AgregarAutorForm" action="DATOSAUTOR.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Autor</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="" maxlength="30" size="20" /></td>
                    </tr>
                    
                    <tr>
                        <td>Fecha de nacimiento: </td>
                        <td><input type="text" name="f_fechan" value="" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        
         <table border="3" cellspacing="0" cellpadding="8" bordercolor="dodgerblue" align="center"> 
            <thead>

                <th>Nombre autor</th>
                <th>Fecha de Nacimiento</th>
                
            </thead>

        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                s_accion = request.getParameter("f_accion");
                s_idautor = request.getParameter("f_idautor");
                
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =  "   delete from autor "
                                    + " where "
                                    + " idautor = " + s_idautor+ "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_fechan = request.getParameter("f_fechan");
                        consulta =  "   insert into "
                                    + " autor(nombre, estado) "
                                    + " values ('"+ s_nombre +"','"+ s_fechan +"')";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " Select idautor, nombre, f_nacimiento "
                        + " from autor ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {  
                    ide = rs.getString(1);
                    num++;

                    %>
                    <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><a href="DATOSAUTOR.jsp?f_accion=E&f_idautor=<%out.print(ide);%>">Eliminar</a></td>
                        <td>Editar</td>
                    </tr>                    
                    <%
                    }
            }catch(Exception e){
                out.print("Error SQL");
            }
        
        %>
       
                <tr align ='center'>
                <td width="60%" bgcolor="powderblue" COLSPAN = "3"><a href="MENU.jsp"><input type="button" value="SALIR" name="f_salir"/></a></td>   
                </tr> 
        </table>
  
    </body>
</html>