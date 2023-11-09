namespace TP11_ProyectoIntegral.Models;
public class Historial{
    public int IDHistorial {get; set;}
    public int IDCompra{get; set;}
    public int IDUsuario {get; set;}
    public DateOnly Fecha {get; set;}
    public int IDLibro {get; set;}
    
    public Historial(){

    }
    public Historial(int IDHistorial = 0,int IDCompra = 0,int IDUsuario =0,DateOnly Fecha = new DateOnly (), int IDLibro = 0){
        this.IDHistorial = IDHistorial;
        this.IDCompra = IDCompra;
        this.IDUsuario = IDUsuario;
        this.Fecha = Fecha;
        this.IDLibro = IDLibro;
    }
}