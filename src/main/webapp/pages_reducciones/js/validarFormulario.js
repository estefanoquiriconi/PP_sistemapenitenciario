// Función de validación
function validarFormulario() {
    // Obtiene los valores de los campos
    var motivo = document.getElementById("motivo").value;
    var fechaReduc = document.getElementById("fechaReduc").value;
    var tiempoDias = document.getElementById("tiempoDias").value;
    var mensajeError = document.getElementById("mensajeError");

    // Limpia los mensajes de error anteriores
    mensajeError.innerHTML = "";

    // Validación del campo motivo (asegúrate de que se haya seleccionado una opción válida)
    if (motivo === "Seleccione el motivo") {
        mensajeError.innerHTML = "Por favor, seleccione un motivo válido.";
        return false; // Evita que el formulario se envíe
    }

    // Validación del campo fechaReduc (asegúrate de que se haya ingresado una fecha)
    if (fechaReduc === "") {
        mensajeError.innerHTML = "Por favor, ingrese una fecha de reducción.";
        return false; // Evita que el formulario se envíe
    }

    // Validación del campo tiempoDias (asegúrate de que se haya ingresado un número positivo)
    if (isNaN(tiempoDias) || tiempoDias <= 0) {
        mensajeError.innerHTML = "Por favor, ingrese un tiempo en días válido.";
        return false; // Evita que el formulario se envíe
    }

    // Si todos los campos son válidos, el formulario se enviará
    return true;
}