function validarEstablecimiento() {
    var nombre = document.getElementById("nombre").value;
    var ciudad = document.getElementById("ciudad").value;
    var direccion = document.getElementById("direccion").value;
    var capacidad = document.getElementById("capacidad").value;
    var telefono = document.getElementById("telefono").value;
    var mensajeError = document.getElementById("mensajeError");
    var telefonoRegex = /^\(\d{3}\) \d{3}-\d{4}$/;

    if (nombre.trim() === "" || ciudad.trim() === "" || direccion.trim() === "" || capacidad.trim() === "" || telefono.trim() === "") {
        mensajeError.textContent = "Todos los campos son obligatorios. Por favor, complete todos los campos.";
        return false;
    } else if (capacidad <= 0){
        mensajeError.textContent = "La capacidad debe ser mayor a 0"; //
        return false;
    }else if(!telefonoRegex.test(telefono)){
        mensajeError.textContent = "El teléfono debe estar en el formato (###) ###-####"; //
        return false;
    }else{
        mensajeError.textContent = ""; // Limpia el mensaje de error si no hay errores
        return true;
    }
}
