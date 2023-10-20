jQuery(document).ready(function ($) {
    $(document).ready(function () {
        $('.mi-selector').select2();
    });
});


$('#fechaNac').datepicker({
    uiLibrary: 'bootstrap5'
});

$('#fechaIngreso').datepicker({
    uiLibrary: 'bootstrap5'
});


function validarFormulario() {
    // Validar DNI de 8 dígitos
    let resultadoValidacion = document.getElementById("resultadoValidacion");
    let error = document.getElementById("error-message");
    resultadoValidacion.value = true;
    var dni = document.getElementById("dni").value;
    if (dni.length < 7 || dni.length > 8) {
        error.innerHTML = "El DNI debe tener 7 u 8 dígitos";
        error.style.display = "block";
        resultadoValidacion = false; // Detiene el envío del formulario
    }

    // Validar otros campos
    var nombre = document.getElementById("nombre").value;
    var apellido = document.getElementById("apellido").value;
    var apodo = document.getElementById("apodo").value;
    var fechaIngreso = document.getElementById("fechaIngreso").value;
    var fechaNac = document.getElementById("fechaNac").value;
    var domicilio = document.getElementById("domicilio").value;
    var dpto_nac = document.getElementById("dpto_nac").value;
    var provincia = document.getElementById("provincia").value;
    var nacionalidad = document.getElementById("nacionalidad").value;

    if (nombre === "" || apellido === "" || apodo === "" || domicilio === "" || dpto_nac === "" || provincia === "" || nacionalidad === "") {
        error.innerHTML = "Todos los campos son obligatorios.";
        error.style.display = "block";
        resultadoValidacion = false; // Detiene el envío del formulario
    }
    if (!(validarFecha(fechaIngreso) && validarFecha(fechaNac))) {
        error.innerHTML = "Las fechas deben tener el formato MM/DD/YYYY.";
        error.style.display = "block";
        resultadoValidacion = false; //
        if (new Date(fechaIngreso) < new Date(fechaNac)) {
            error.innerHTML = "La fecha de nacimiento no puede ser mayor a la fecha de ingreso";
            error.style.display = "block";
            resultadoValidacion = false;
        }
    }

    return resultadoValidacion; // Envía el formulario si pasa todas las validaciones
}

function validarFecha(fecha) {

    // Expresión regular para validar "mm/dd/yyyy"
    const regex = /^(0[1-9]|1[0-2])\/(0[1-9]|[12][0-9]|3[01])\/\d{4}$/;

    if (regex.test(fecha)) {
        return true; // La fecha es válida
    } else {
        return false; // La fecha no es válida
    }
}
