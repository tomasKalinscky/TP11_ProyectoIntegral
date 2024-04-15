using System.Data.SqlClient;
using Dapper;
using System.Collections.Generic;

namespace TP11_ProyectoIntegral.Models;


public static class BD
{
    private static string _connectionString = @"Server=localhost;Database=BDTP11;Trusted_Connection=True;";

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
    public static int BuscarIDAutor(string nombreAutor){
        int devolver = -1;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT IDAutor FROM Autor where nombre = @pnombreActor ";
            devolver = db.QueryFirstOrDefault<int>(sql, new {pnombreActor = nombreAutor});
        }
        if (devolver == -1 || devolver== 0)
        {
            string Biografia = "Autor nuevo";
            using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Autor (Nombre,Biografia) VALUES (@pNombre,@pBiografia)";
            db.Execute(sql, new {pNombre = nombreAutor,pBiografia = Biografia});
            }
            using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT IDAutor FROM Autor where nombre = @pnombreActor ";
            devolver = db.QueryFirstOrDefault<int>(sql, new {pnombreActor = nombreAutor});
        }
        }
        return devolver;
    }
    public static int BuscarIDGenero(string nombreGenero){
        int devolver = -1;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT IDGenero FROM Genero where nombre = @pnombreGenero ";
            devolver = db.QueryFirstOrDefault<int>(sql, new {pnombreGenero = nombreGenero});
        }
        if (devolver == 0 || devolver == -1)
        {
            using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Genero (Nombre) VALUES (@pNombre)";
            db.Execute(sql, new {pNombre = nombreGenero});
            }
            using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT IDGenero FROM Genero where nombre = @pnombreGenero ";
            devolver = db.QueryFirstOrDefault<int>(sql, new {pnombreGenero = nombreGenero});
        }
        }
        return devolver;
    }
    public static bool AgregarLibro(string Titulo,int FKGenero,string Descripcion,DateTime FechaDePublicacion,int FKAutor,int Stock,string Imagen,float Precio){
        int n;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Libro (Titulo, FKGenero, Descripcion, FechaDePublicacion,FKAutor,Stock,Imagen,Precio) VALUES (@pTitulo,@pFKGenero,@pDescripcion,@pFechaDepublicacion,@pFKAutor,@pStock,@pImagen,@pPrecio)";
            n = db.Execute(sql, new {pTitulo = Titulo, pFKGenero = FKGenero, pDescripcion=Descripcion, pFechaDePublicacion =FechaDePublicacion, pFKAutor = FKAutor,pStock = Stock, pImagen = Imagen, pPrecio = Precio});
        }
        return n != 0;
    }
    public static bool guardarCompra(DetalleCompra com){
        int n;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO DetalleCompra (FKUsuario, FKLibro, Precio, FKMetodoDePago,FechaYHora) VALUES (@pUsuario, @pLibro, @pPrecio, @pMetodo, @pFecha)";
            n = db.Execute(sql, new {pUsuario = com.FKUsuario, pLibro = com.FKLibro, pPrecio=com.Precio, pMetodo = com.FKMetodoDePago, pFecha = com.FechaYHora});
        }
        return n != 0;
    }
    public static List<Libro> BuscarLibro(string loquepongaenelbuscador)
    {
        List<Libro> libros = new List<Libro>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql;
            sql = "Select * From Libro Where Titulo Like '%' + @pTitulo +'%' or FKGenero = (select IDGenero from Genero where LOWER(nombre) LIKE '%'+ LOWER(@pTitulo)+'%') or FKAutor = (select IDAutor from Autor where LOWER(nombre) LIKE '%'+ LOWER(@pTitulo)+'%') ";
            libros = db.Query<Libro>(sql, new {pTitulo = loquepongaenelbuscador}).ToList();
        }
        return libros;
    }
    public static bool RegistrarUsuario(Usuario us){
        int n;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "INSERT INTO Usuario (NombreUsuario, Contraseña, Genero, Edad, Gmail, Telefono) VALUES (@pusername, @pcontraseña ,@pgenero, @pedad, @pemail, @ptelefono)";
            n = db.Execute(sql, new {pusername = us.NombreUsuario, pcontraseña = us.Contraseña,pGenero = us.Genero, pedad = us.Edad, pemail = us.Gmail, ptelefono = us.Telefono});
        }
        return n != 0;
    }
     public static bool Login(string username, string contraseña){
        Usuario broder;
        using (SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Usuario where NombreUsuario = @pusername AND Contraseña = @pcontraseña";
            broder = db.QueryFirstOrDefault<Usuario>(sql, new {pusername = username, pcontraseña = contraseña});
        }
        if (broder != null && !string.IsNullOrEmpty(broder.NombreUsuario)) 
        {
            user = broder;
            return true; 
        } 
        else 
        {
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

    public static List<MetodoPago> obtenerMetodosPago() {
        List<MetodoPago> metodosPago = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            
            string sql = "select * from MetodoPago";
            metodosPago = db.Query<MetodoPago>(sql).ToList();
        }
        return metodosPago;
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
        List<Historial> historial = new List<Historial>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "Select * From Historial Where IDUsuario = @pIDUsuario";
            historial = db.Query<Historial>(sql, new{pIDUsuario = IDUsuario}).ToList();  
        }
        return historial;
    }
    public static List<MetodoPago> ListarMetodoDePago(){
        List<MetodoPago> metodos = new List<MetodoPago>();
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "Select * From MetodoPago";
            metodos = db.Query<MetodoPago>(sql).ToList();  
        }
        return metodos;
    }
}