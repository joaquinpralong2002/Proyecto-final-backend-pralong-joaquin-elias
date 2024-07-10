console.log("Entro a GetRequest");
const table = new DataTable('#pelis', {
  language: {
    "decimal": "",
    "emptyTable": "No hay información",
    "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
    "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
    "infoFiltered": "(Filtrado de _MAX_ total entradas)",
    "infoPostFix": "",
    "thousands": ",",
    "lengthMenu": "Mostrar _MENU_ Entradas",
    "loadingRecords": "Cargando...",
    "processing": "Procesando...",
    "search": "Buscar:",
    "zeroRecords": "Sin resultados encontrados",
    "paginate": {
      "first": "Primero",
      "last": "Ultimo",
      "next": "Siguiente",
      "previous": "Anterior"
    }
  },
  scrollY: 600,
  paging: true,
  lengthMenu: [7,5,3],
});

document.addEventListener("DOMContentLoaded", function () {

  const movieSection = document.getElementById("pelis");
  const movies = [];

  function loadMovieList() {
    console.log("Entro a loadMovieList");
    fetch("/peliculas-1.0-SNAPSHOT/movies?action=getAll")
      .then(response => response.json())
      .then(data => {
        console.log("data : " + data);
        data.forEach(movie => {
          table.row.add([
            movie.nombre,
            movie.descripcion,
            movie.genero,
            movie.calificacion,
            movie.estrellas,
            movie.anio
          ]).draw(); // Dibuja la fila en la tabla
        });
      });
  }
  loadMovieList();
});