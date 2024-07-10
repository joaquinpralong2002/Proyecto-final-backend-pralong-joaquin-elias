package edu.ar.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static edu.ar.data.Conexion.close;
import static edu.ar.data.Conexion.getConexion;

import edu.ar.model.Pelicula;

public class PeliculaDAO {

  private static final String SQL_SELECT = "SELECT * FROM movies";
  private static final String SQL_SELECT_BY_ID = "SELECT * FROM movie WHERE id = ?";
  private static final String SQL_INSERT =
          "INSERT INTO movies (nombre, descripcion, genero, calificacion, anio, estrellas, director) values (?,?,?,?,?,?,?)";
  private static final String SQL_UPDATE =
          "UPDATE movie SET nombre = ?, descripcion = ?, genero = ?, calificacion = ?, anio = ?, estrellas = ?, director = ? WHERE id = ?";
  private static final String SQL_DELETE = "DELETE FROM movie WHERE id = ?";


  public static List<Pelicula> obtener() {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Pelicula pelicula = null;
    List<Pelicula> peliculas = new ArrayList<>();

    try {
      conn = getConexion();
      ps = conn.prepareStatement(SQL_SELECT);
      rs = ps.executeQuery();

      //Itero los resultados del ResultSet
      while(rs.next()){
        int id = rs.getInt("id_movie");
        String nombre = rs.getString("nombre");
        String descripcion = rs.getString("descripcion");
        String genero = rs.getString("genero");
        float calificacion = rs.getFloat("calificacion");
        int anio = rs.getInt("anio");
        float estrellas = rs.getFloat("estrellas");
        String director = rs.getString("director");

        pelicula = new Pelicula(id, nombre, descripcion, genero, calificacion, anio, estrellas, director);

        //agregar la pelicula en nuestro listado de pelis
        peliculas.add(pelicula);

      }
    } catch (Exception e) {
      e.printStackTrace(System.out);
    } finally {
      try {
        close(rs);
        close(ps);
        close(conn);
      } catch(Exception e) {
        e.printStackTrace(System.out);
      }
    }
    return peliculas;
  }


  public static Pelicula seleccionarPorId(int id) {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Pelicula pelicula = null;

    try {
      conn = getConexion();
      ps = conn.prepareStatement(SQL_SELECT_BY_ID);
      ps.setInt(1, id);
      rs = ps.executeQuery();

      while (rs.next()) {
        int idPeli = rs.getInt("id");
        String nombre = rs.getString("nombre");
        String descripcion = rs.getString("descripcion");
        String genero = rs.getString("genero");
        int calificacion = rs.getInt("calificacion");
        int anio = rs.getInt("anio");
        byte estrellas = rs.getByte("estrellas");
        String director = rs.getString("director");

        pelicula = new Pelicula(nombre, descripcion, genero, calificacion, anio, estrellas, director);
      }
    } catch(Exception e) {
      e.printStackTrace(System.out);
    } finally {
      try {
        close(rs);
        close(ps);
        close(conn);
      } catch(Exception e) {
        e.printStackTrace(System.out);
      }
    }
    return pelicula;
  }


  public static int insertar(Pelicula pelicula){
    Connection conn = null;
    PreparedStatement ps = null;
    int registros = 0;

    try {
      conn = getConexion();
      ps = conn.prepareStatement(SQL_INSERT);
      ps.setString(1, pelicula.getNombre());
      ps.setString(2, pelicula.getDescripcion());
      ps.setString(3, pelicula.getGenero());
      ps.setFloat(4, pelicula.getCalificacion());
      ps.setInt(5, pelicula.getAnio());
      ps.setFloat(6, pelicula.getEstrellas());
      ps.setString(7, pelicula.getDirector());

      registros = ps.executeUpdate();

    } catch (Exception ex){
      ex.printStackTrace(System.out);
    } finally {
      try {
        close(ps);
        close(conn);
      } catch (Exception ex){
        ex.printStackTrace(System.out);
      }
    }

    return registros;
  }


  public static int actualizar(Pelicula pelicula, int id) {
    Connection conn = null;
    PreparedStatement ps = null;
    int registros = 0;

    try {
      conn = getConexion();
      ps = conn.prepareStatement(SQL_UPDATE);
      ps.setString(1, pelicula.getNombre());
      ps.setString(2, pelicula.getDescripcion());
      ps.setString(3, pelicula.getGenero());
      ps.setFloat(4, pelicula.getCalificacion());
      ps.setInt(5, pelicula.getAnio());
      ps.setFloat(6, pelicula.getEstrellas());
      ps.setString(7, pelicula.getDirector());
      ps.setInt(8, id);

      registros = ps.executeUpdate();
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    } finally {
      try {
        close(ps);
        close(conn);
      } catch (Exception ex) {
        ex.printStackTrace(System.out);
      }
    }

    return registros;
  }

  public static int eliminar(int id) {
    Connection conn = null;
    PreparedStatement ps = null;
    int registros = 0;

    try {
      conn = getConexion();
      ps = conn.prepareStatement(SQL_DELETE);
      ps.setInt(1, id);

      registros = ps.executeUpdate();
    } catch (Exception ex) {
      ex.printStackTrace(System.out);
    } finally {
      try {
        close(ps);
        close(conn);
      } catch (Exception ex) {
        ex.printStackTrace(System.out);
      }
    }

    return registros;
  }

}
