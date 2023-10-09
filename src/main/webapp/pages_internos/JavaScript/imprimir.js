function imprimirPagina() {
    // Ocultar el botón de impresión
    document.getElementById('botonImprimir').style.display = 'none';
    document.getElementById('botonImprimir').style.display = 'none';

    // Iniciar la impresión
    window.print();

    // Restaurar el botón de impresión y ocultar la tabla después de imprimir
    document.getElementById('botonImprimir').style.display = 'block';
}
