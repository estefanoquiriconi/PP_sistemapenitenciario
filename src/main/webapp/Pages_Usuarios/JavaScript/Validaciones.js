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
        estado.style.color = "green";
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

function validarUsuario() {
    let valido = false;
    // Cambiar document.getElementsByName a document.getElementById para seleccionar elementos por ID
    let usuario = document.getElementById("nombre");
    let contrasenia = document.getElementById("password");
    let confirmContrasenia = document.getElementById("passwordConfirm");
    let formulario=document.getElementById("formularioAlta");
    let resultadoValidacion = document.getElementById("resultadoValidacion");
    let errorUsuario= document.getElementById("error-messageUser");
    let errorPass= document.getElementById("error-messagePass");
    let errorPassConfirm= document.getElementById("error-messagePassConfirm");
    let regExpPass = /^(?=(?:[^A-Za-z]*[A-Za-z]){1})(?=(?:\D*\d){1})[A-Za-z\d]+$/;
    let regExpUsu = /^[A-Z][a-zA-Z]*\d{2}$/;
    try {
       if(regExpUsu.test(usuario.value)){
         errorUsuario.style.display ="none";
        if (regExpPass.test(contrasenia.value)) {
             errorPass.style.display ="none";
            usuario.value = usuario.value.trim(); // quitamos espacios en blanco
            valido = true;
            if(formulario.id==="formularioAlta"){
                valido=confirmarContrasenia(contrasenia,confirmContrasenia);
             if(valido){
                 errorPassConfirm.style.display="none";
             }else{
                 errorPassConfirm.innerHTML="ERROR: no existe match entre contraseñas";
                 errorPassConfirm.style.display="block";
             }
            }
        }else{
                errorPass.innerHTML="ERROR:Contraseña inválida: Formato(A-9)";
                errorPass.style.display="block";
        }
    } else {
          errorUsuario.innerHTML="ERROR:Usuario inválido: Formato(A-99)";
           errorUsuario.style.display="block";
            throw new Error(); // Lanzar un nuevo Error
        }
    } catch (Error) {
      
    }
    resultadoValidacion.value = valido;
    return valido;
}
function  confirmarContrasenia(Pass1,Pass2){
    isMatch=true;
    if(!(Pass1.value===Pass2.value)){
        isMatch=false;
    }
    return isMatch;
} 