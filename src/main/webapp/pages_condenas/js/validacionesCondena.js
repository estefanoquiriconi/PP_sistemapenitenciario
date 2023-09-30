function validarFormulario() {
    var juez = document.getElementById("juez").value;
    var fechaDetencion = document.getElementById("fechaDetencion").value;
    var fechaInicio = document.getElementById("fechaInicio").value;
    var cantDias = document.getElementById("cantDias").value;

    var mensajeError = document.getElementById("mensajeError");
    mensajeError.innerHTML = "";

    if (juez === "") {
        mensajeError.innerHTML += "Por favor, ingrese el nombre del juez.<br>";
    }

    if (fechaDetencion === "" || fechaInicio === "") {
        mensajeError.innerHTML += "Por favor, ingrese las fechas de detención e inicio de la condena.<br>";
    }

    if (new Date(fechaDetencion) > new Date(fechaInicio)) {
        mensajeError.innerHTML += "La fecha de detención debe ser anterior o igual a la fecha de inicio de la condena.<br>";
    }

    if (isNaN(cantDias) || cantDias <= 0) {
        mensajeError.innerHTML += "Por favor, ingrese una duración válida en días.<br>";
    }

    if (mensajeError.innerHTML !== "") {
        return false;
    }

    return true;
}
