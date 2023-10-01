// Función para actualizar la fecha en tiempo real
function actualizarFecha() {
    const elementoFecha = document.getElementById("fecha");
    const fechaActual = new Date();

    // Obtener las partes de la fecha
    const dia = fechaActual.getDate();
    const mes = fechaActual.getMonth() + 1; // Los meses comienzan en 0 (enero es 0)
    const anio = fechaActual.getFullYear();

    // Formatear la fecha como "dd/mm/yyyy"
    const fechaFormateada = dia + "/" + mes + "/" + anio;

    elementoFecha.textContent = fechaFormateada;
}

// Llamar a la función una vez para mostrar la fecha de inmediato
actualizarFecha();