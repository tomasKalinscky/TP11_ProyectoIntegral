namespace TP11_ProyectoIntegral.Models;
public class Libro{
    public int IDLibro {get; set;}
    public int FKAutor {get; set;}
    public int FKGenero {get; set;}
    public DateOnly FechaDePublicacion {get; set;}
    public string Descripcion {get; set;}
    public Libro(){

    }
    public Libro(int IDLibro = 0,int FKAutor = 0,int FKGenero =0,DateOnly FechaDePublicacion = new DateOnly() ,string Descripcion = ""){
        this.IDLibro = IDLibro;
        this.FKAutor = FKAutor;
        this.FKGenero = FKGenero;
        this.FechaDePublicacion = FechaDePublicacion;
        this.Descripcion = Descripcion;
    }
}