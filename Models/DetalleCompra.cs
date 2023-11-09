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
    public DetalleCompra(int IDCompra  = 0,int IDLibro = 0,int IDUsuario =0, DateTime FechaYHora = new DateTime() ,int FKMetodoPago = 0,float Precio = 0){
        this.IDCompra = IDCompra;
        this.IDLibro = IDLibro;
        this.IDUsuario = IDUsuario;
        this.FechaYHora = FechaYHora;
        this.FKMetodoPago = FKMetodoPago;
        this.Precio = Precio;

    }
}