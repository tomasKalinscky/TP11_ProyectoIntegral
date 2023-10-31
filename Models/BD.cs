using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

namespace TP11_ProyectoIntegral.Models;


public static class BD
{
    private static string _connectionString = @"Server=localhost; DataBase=BDTP11;Trusted_Connection=True;";

    public static Libro DetalleLibro(int IDLibro){
        Libro libro;
        using (SqlConnection db = New SqlConnection(_connectionString))
        {
            string sql = "SELECT * from Libro where IDLibro = pIDLibro";
            libro = db.QueryFirstOrDefault<Libro>(sql,new {pIDLibro = IDLibro})
        }
        return libro;
    }
    public static List<Libro> libros = new List<Libro>();
    public static List<Libro> ListarLibros(){
        List<Libro> libros;
        using (SqlConnection db = New SqlConnection(_connectionString))
        {
            string sql = "SELECT * from Libro";
            libro = db.Query<Libro>(sql)
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
        if (broder != null && !string.IsNullOrEmpty(broder.UserName)) {
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
}