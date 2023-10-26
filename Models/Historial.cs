namespace TP11_ProyectoIntegral.Models;
public class Historial{
    public int IDHistorial {get; set;}
    public int IDPrestamo {get; set;}
    public int IDUsuario {get; set;}
    public date Fecha {get; set;}
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