/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function validarEstado(valor) {

    let estado = document.getElementById('estado' + valor);
    let contenido = estado.textContent.trim();
    if (contenido === "Inactivo") { //pregunta el valor del campo estado convertido en string(getString)
        estado.style.color = "red";
    } else if (contenido === "Activo") {//aplica color al estado segun su valor
        estado.style.color = "blue";
    }
}
function cancelarModificacion() {
    var botonCancelar = document.getElementById('botonCancelar');
    botonCancelar.addEventListener('click', function () {
        // Prevenir el envío del formulario
        var formulario = document.getElementById('formularioModificar');
        formulario.reset(); // Opcional: Restablecer los campos del formulario
    });
    return window.location.href = "../index.jsp";
}
//llamada(login.jsp-(altaUsuario.jsp),valida contraseña(AAAAAA999) y usuario(AAAA..99)

function validarUsuario(formularioId) {
function validarUsuario() {
    let valido = false;
    let form = document.getElementById(formularioId); 
    let resultadoValidacion = form.querySelector("#resultadoValidacion");// Obtener el formulario por su ID
if(!(form.id==='formularioActualizacionPass')){
    
    let usuario = form.querySelector("#nombre");
    let errorUsuario = form.querySelector("#error-messageUser");
    
    
    let regExpUsu = /^[A-ZÁÉÍÓÚÜÑ][a-záéíóúüñ]+[0-9]{2}$/;

    if (regExpUsu.test(usuario.value)) {
        errorUsuario.style.display = "none";
        valido = ActualizarContrasenia(form); // Pasar el formulario como argumento
    } else {
        errorUsuario.innerHTML = "ERROR: Usuario inválido: Formato(A-99)";
        errorUsuario.style.display = "block";
    }
    }else{ valido = ActualizarContrasenia(form);}
    resultadoValidacion.value = valido;
    return valido;
}

function confirmarContrasenia(Pass1, Pass2) {
    return Pass1.value === Pass2.value;
}

function ActualizarContrasenia(form) { // Añadir el formulario como argumento
    
    let contrasenia = form.querySelector("#password");
    let confirmContrasenia = form.querySelector("#passwordConfirm");
    let errorPass = form.querySelector("#error-messagePass");
    let errorPassConfirm = form.querySelector("#error-messagePassConfirm");
    
    let regExpPass = /^(?=(?:[^A-Za-z]*[A-Za-z]){1})(?=(?:\D*\d){1})[A-Za-z\d]+$/;
    let valido = true;

    if (regExpPass.test(contrasenia.value)) {
        errorPass.style.display = "none";
    } else {
        errorPass.innerHTML = "ERROR: Contraseña inválida: Formato(A-9)";
        errorPass.style.display = "block";
        valido = false;
    }

    if (confirmarContrasenia(contrasenia, confirmContrasenia)) {
        errorPassConfirm.style.display = "none";
    } else {
        errorPassConfirm.innerHTML = "ERROR: no existe match entre contraseñas";
        errorPassConfirm.style.display = "block";
        valido = false;
    }
   
    return valido;
}