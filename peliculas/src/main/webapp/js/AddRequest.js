console.log("Entro a AddRequest");

const formulario = document.getElementById('formulario');

formulario.addEventListener('submit', (event) => {
    event.preventDefault();

    const nombre = document.getElementById('nombre').value;
    const descripcion = document.getElementById('descripcion').value;
    const genero = document.getElementById('genero').value;
    const calificacion = parseFloat(document.getElementById('calificacion').value);
    const anio = parseInt(document.getElementById('anio').value);
    const estrellas = parseFloat(document.getElementById('estrellas').value);
    const director = document.getElementById('director').value;

    const data = {
        nombre: nombre,
        descripcion: descripcion,
        genero: genero,
        calificacion: calificacion,
        anio: anio,
        estrellas: estrellas,
        director: director
    };

    fetch('/peliculas-1.0-SNAPSHOT/movies?action=add', {
        method: 'POST',
        body: JSON.stringify(data),
        headers: {
            'Content-Type': 'application/json'
        }
    })
        .then(response => response.json())
        .then(data => {
            if (data.message.includes('guardada exitosamente')) {
                Swal.fire({
                    title: '¡Película agregada!',
                    text: data.message,
                    icon: 'success',
                    confirmButtonColor: '#3085d6',
                    confirmButtonText: 'Aceptar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = '/peliculas'; // Reemplazar con la URL deseada
                    }
                });
            } else {
                Swal.fire({
                    title: 'Error',
                    text: data.message,
                    icon: 'error',
                    confirmButtonColor: '#dc3545',
                    confirmButtonText: 'Aceptar'
                });
            }
        });
});