namespace TP11_ProyectoIntegral.Models;
public class Libro{
    public int IDLibro {get; set;}
    public string Titulo {get; set;}
    public int FKGenero {get; set;}
    public string Descripcion {get; set;}
    public DateTime FechaDePublicacion {get; set;}
    public int FKAutor {get; set;}
    public int Stock {get; set;}
    public string Foto {get; set;}
    public float Precio {get; set;}
    public Libro(){

    }
    public Libro(int IDLibro = 0,string Titulo = "",int FKGenero =0 ,string Descripcion = "" ,DateTime FechaDePublicacion = new DateTime(), int FKAutor = 0, int Stock = 0, string Foto = "", float Precio = 0){
        this.IDLibro = IDLibro;
        this.Titulo = Titulo;
        this.Precio= Precio;
        this.FKAutor = FKAutor;
        this.FKGenero = FKGenero;
        this.FechaDePublicacion = FechaDePublicacion;
        this.Descripcion = Descripcion;
        this.Stock = Stock;
        this.Foto = Foto;
    }
}