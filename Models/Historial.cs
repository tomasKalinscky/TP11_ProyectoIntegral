namespace TP11_ProyectoIntegral.Models;
public class Historial{
    public int IDHistorial {get; set;}
    public int IDCompra{get; set;}
    public int IDUsuario {get; set;}
    public DateTime Fecha {get; set;}
    public string TituloLibro {get; set;}
    
    public Historial(){

    }
    public Historial(int IDHistorial = 0,int IDCompra = 0,int IDUsuario =0,DateTime Fecha = new DateTime(), string TituloLibro = " "){
        this.IDHistorial = IDHistorial;
        this.IDCompra = IDCompra;
        this.IDUsuario = IDUsuario;
        this.Fecha = Fecha;
        this.TituloLibro = TituloLibro;
    }
}