namespace TP11_ProyectoIntegral.Models;
public class Libros{
    public int IDLibro {get; set;}
    public int FKAutor {get; set;}
    public int FKGenero {get; set;}
    public date FechaDePublicacion {get; set;}
    public string Vendedor {get; set;}
    public string Libro {get; set;}
    
    public Historial(){

    }
    public Historial(int IDHistorial = 0,int IDPrestamo = 0,int IDUsuario =0,date Fecha = null,string Vendedor = "",string Libro = ""){
        this.IDHistorial = IDHistorial;
        this.IDPrestamo = IDPrestamo;
        this.IDUsuario = IDUsuario;
        this.Fecha = Fecha;
        this.Vendedor = Vendedor;
        this.Libro = Libro;
    }
}