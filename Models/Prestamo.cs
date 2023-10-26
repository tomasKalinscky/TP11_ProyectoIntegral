namespace TP11_ProyectoIntegral.Models;
public class Prestamo{
    public int IDPrestamo {get; set;}
    public int FKLibro {get; set;}
    public int FKUsuario {get; set;}
    public date FechaPrestamo {get; set;}
    public date FechaVencimiento {get; set;}
    public string EstadoPrestamo {get; set;}
    public Prestamo(){

    }
    public Prestamo(int IDPrestamo = 0,int FKLibro = 0,int FKUsuario =0,date FechaPrestamo = null,date FechaVencimiento = null,string EstadoPrestamo = ""){
        this.IDPrestamo = IDPrestamo;
        this.FKLibro = FKLibro;
        this.FKUsuario = FKUsuario;
        this.FechaPrestamo = FechaPrestamo;
        this.FechaVencimiento = FechaVencimiento;
        this.EstadoPrestamo = EstadoPrestamo;

    }
}