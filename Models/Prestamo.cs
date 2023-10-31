namespace TP11_ProyectoIntegral.Models;
public class Prestamo{
    public int IDPrestamo {get; set;}
    public int FKLibro {get; set;}
    public int FKUsuario {get; set;}
    public DateOnly FechaPrestamo {get; set;}
    public DateOnly FechaVencimiento {get; set;}
    public string EstadoPrestamo {get; set;}
    public Prestamo(){

    }
    public Prestamo(int IDPrestamo = 0,int FKLibro = 0,int FKUsuario =0, DateOnly FechaPrestamo = new DateOnly() , DateOnly FechaVencimiento = new DateOnly() ,string EstadoPrestamo = ""){
        this.IDPrestamo = IDPrestamo;
        this.FKLibro = FKLibro;
        this.FKUsuario = FKUsuario;
        this.FechaPrestamo = FechaPrestamo;
        this.FechaVencimiento = FechaVencimiento;
        this.EstadoPrestamo = EstadoPrestamo;

    }
}