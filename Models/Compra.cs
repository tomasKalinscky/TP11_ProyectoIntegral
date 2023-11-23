namespace TP11_ProyectoIntegral.Models;

public class Compra{
    public int IDCompra {get; set;}
    public int FKUsuario {get; set;}
    public int FKLibro {get; set;}
    public DateTime FechaCompra {get; set;}

    public Compra(){

    }
    public Compra(int IDCompra = 0,int FKUsuario = 0,int FKLibro =0,DateTime FechaCompra = new DateTime()){
        this.IDCompra = IDCompra;
        this.FKUsuario = FKUsuario;
        this.FKLibro= FKLibro;
        this.FechaCompra = FechaCompra;
    }
}