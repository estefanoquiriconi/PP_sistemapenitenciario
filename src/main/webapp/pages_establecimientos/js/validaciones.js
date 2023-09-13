function validarEstablecimiento() {
    var nombre = document.getElementById("nombre").value;
    var ciudad = document.getElementById("ciudad").value;
    var direccion = document.getElementById("direccion").value;
    var capacidad = document.getElementById("capacidad").value;
    var telefono = document.getElementById("telefono").value;
    validarTelefono();

    var mensajeError = document.getElementById("mensajeError");

    if (nombre.trim() === "" || ciudad.trim() === "" || direccion.trim() === "" || capacidad.trim() === "" || telefono.trim() === "") {
        mensajeError.textContent = "Todos los campos son obligatorios. Por favor, complete todos los campos.";
        return false;
    } else {
        mensajeError.textContent = ""; // Limpia el mensaje de error si no hay errores
        return true;
    }
}

function validarTelefono() {
    var telefono = document.getElementById("telefono").value;
    var mensajeErrorTelefono = document.getElementById("mensajeErrorTelefono");

    // Expresión regular para validar números de teléfono en Argentina
    var expresionRegular = /^(?:(?:\+|00)54|0)[1-9]\d{9}$/;

    if (!expresionRegular.test(telefono)) {
        mensajeErrorTelefono.textContent = "Número de teléfono no válido. Utiliza el formato correcto.";
        return false;
    } else {
        mensajeErrorTelefono.textContent = ""; // Limpia el mensaje de error si no hay errores
        return true;
    }
}