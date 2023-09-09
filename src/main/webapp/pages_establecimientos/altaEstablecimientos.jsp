<%-- 
    Document   : altaEstablecimientos
    Created on : 9 sep. 2023, 18:38:12
    Author     : tano_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta establecimiento</title>
    </head>
    <body>
        <h1>Formulario de Alta de Establecimientos</h1>
        <form action="../SvEstablecimientos" method="POST">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" required><br><br>

            <label for="ciudad">Ciudad:</label>
            <select id="ciudad" name="ciudad" required>
                <option value="Santiago De Estero">Santiago Del Estero</option>
                <option value="La banda">La Banda</option>
                <option value="Sumampa">Sumampa</option>
            </select><br><br>

            <label for="capacidad">Capacidad:</label>
            <input type="number" id="capacidad" name="capacidad" required><br><br>

            <label for="direccion">Dirección:</label>
            <input type="text" id="direccion" name="direccion" required><br><br>

            <label for="telefono">Teléfono:</label>
            <input type="tel" id="telefono" name="telefono" required><br><br>
            
            <button type="submit">Enviar</button>
        </form>
    </body>
</html>
