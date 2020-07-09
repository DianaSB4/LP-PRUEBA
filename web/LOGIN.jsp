<%-- 
    Document   : LOGIN
    Created on : 25/06/2020, 09:40:20 AM
    Author     : crystopher 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
                  Patrick Mansilla : 1er commit
        <form name="f_validar" action="VALIDA.jsp">
            <div align="center" >
            <table border="3" cellspacing="0" cellpadding="8" bordercolor="dodgerblue" align="center">
                <thead>
                    <tr>
                        <th colspan="2" bgcolor="LIGHTBLUE"><strong>Ingrese usuario y clave</strong></th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Usuario: </td>
                        <td><input type="text" name="f_usuario" value="" /></td>
                    </tr>
                    <tr>
                        <td>Contraseña: </td>
                        <td><input type="password" name="f_contraseña" value="" /></td>
                    </tr>
                    <tr>
                        <td>Tipo: </td>
                        <td>
                            <form>
                        <select style="text-align:center" name="f_tipo"  >
                          <option>Practica</option>
                          <option>Examen Parcial</option>
                        </select>
                        </div>
                        </form>
                            </td>
                    </tr>
                    <tr align ='center'>
                        <td colspan='2'><input type="submit" value="INGRESAR" name="f_ingresar" /></td>      
                    </tr>
                </tbody>
            </table>
                </div>
        </form>
    </body>
</html>
