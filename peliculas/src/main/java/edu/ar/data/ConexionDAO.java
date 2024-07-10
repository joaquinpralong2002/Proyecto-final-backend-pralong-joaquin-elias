package edu.ar.data;

import edu.ar.model.Pelicula;

import java.sql.SQLException;
import java.util.List;

public class ConexionDAO {

    public static void main(String[] args) throws SQLException {
        Conexion.getConexion();
        
         List<Pelicula> lista = PeliculaDAO.obtener();
         for(Pelicula peliula : lista) {
         System.out.println(peliula);
         System.out.println();
         }
         

        /*
         * Pelicula pelicula = new Pelicula("Furiosa: de la saga Mad Max",
         * "La joven Furiosa es arrebatada del Paraje Verde de las Muchas Madres por una horda de motociclistas. El señor de la guerra que dirige su grupo se enfrenta a otro tirano y, mientras tanto, Furiosa aprovecha la batalla para intentar volver a casa.\n"
         * , "Acción, Ciencia ficción", 3.7F, 2024, 4.3F, "George Miller");
         * PeliculaDAO.insertar(pelicula);
         */

    }

}
