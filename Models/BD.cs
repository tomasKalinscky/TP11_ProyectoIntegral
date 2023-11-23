using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

namespace TP11_ProyectoIntegral.Models;


public static class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=BDTP11;Trusted_Connection=True;";
    public static Usuario user = null;
    
    public static List<Libro> ListarLibrosYFiltros(int? IdAutor = null, int? IdGenero = null){
        List<Libro> libros = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            
            string sql = "SP_FiltrosLibros";
            libros = db.Query<Libro>(sql, new{pAutor = IdAutor, pGenero = IdGenero},
                    commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
        return libros;
    }
    public static bool RegistrarUsuario(Usuario us){
        int n;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Usuario (NombreUsuario, Contraseña, Gmail, Telefono) VALUES (@pusername, @pcontraseña, @pemail, @ptelefono)";
            n = db.Execute(sql, new {pusername = us.NombreUsuario, pcontraseña = us.Contraseña, pemail = us.Gmail, ptelefono = us.Telefono});
        }
        return n != 0;
    }
    public static bool Login(string username, string contraseña){
        Usuario broder;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Usuario where NombreUsuario = @pusername AND Contraseña = @pcontraseña";
            broder = db.QueryFirstOrDefault<Usuario>(sql, new {pusername = username, pcontraseña = contraseña});
        }
        if (broder != null && !string.IsNullOrEmpty(broder.NombreUsuario)) {
            user = broder;
        return true; 
    } else {
        return false; 
    }
    }
    public static bool RecuperarContraseña(string usuario, string contraseña){
        int n;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "UPDATE Usuario SET Contraseña = @pcontraseña WHERE NombreUsuario = @pusuario";
            n = db.Execute(sql, new {pcontraseña = contraseña, pusuario = usuario});
        }
        return n != 0;
    }
    public static Libro DetalleLibro(int idlibro){
        Libro libro = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SP_DetalleLibro";
            libro = db.QueryFirstOrDefault<Libro>(sql, new{pidlibro = idlibro},
                    commandType: System.Data.CommandType.StoredProcedure);
        }
        return libro;
    }
    public static List<Historial> ObtenerHistorial(int IDUsuario){
        List<Historial> historial = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            
            string sql = "select * from historial where IDUsuario = @pIDUsuario";
            historial = db.Query<Historial>(sql, new{pIDUsuario = IDUsuario},
                    commandType: System.Data.CommandType.StoredProcedure).ToList();
        }
        return historial;
    }
   
}