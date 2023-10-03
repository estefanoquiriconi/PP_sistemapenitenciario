jQuery(document).ready(function($){
    $(document).ready(function() {
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
    var domicilio = document.getElementById("domicilio").value;
    var dpto_nac = document.getElementById("dpto_nac").value;
    var provincia = document.getElementById("provincia").value;
    var nacionalidad = document.getElementById("nacionalidad").value;

    if (nombre === "" || apellido === "" || apodo === "" || domicilio === "" || dpto_nac === "" || provincia === "" || nacionalidad === "") {
        error.innerHTML = "Todos los campos son obligatorios.";
        error.style.display = "block";
        resultadoValidacion = false; // Detiene el envío del formulario
    }

    return resultadoValidacion; // Envía el formulario si pasa todas las validaciones
}