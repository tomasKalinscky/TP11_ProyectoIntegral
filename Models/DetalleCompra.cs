namespace TP11_ProyectoIntegral.Models;
public class DetalleCompra{
    public int IDCompra {get; set;}
    public int IDLibro {get; set;}
    public int IDUsuario {get; set;}
    public DateTime FechaYHora {get; set;}
    public int FKMetodoPago {get; set;}
    public float Precio {get;set;}
    public DetalleCompra(){

    }
    public DetalleCompra(int IDPrestamo = 0,int FKLibro = 0,int FKUsuario =0, DateOnly FechaPrestamo = new DateOnly() , DateOnly FechaVencimiento = new DateOnly() ,string EstadoPrestamo = ""){
        this.IDPrestamo = IDPrestamo;
        this.FKLibro = FKLibro;
        this.FKUsuario = FKUsuario;
        this.FechaPrestamo = FechaPrestamo;
        this.FechaVencimiento = FechaVencimiento;
        this.EstadoPrestamo = EstadoPrestamo;

    }
}