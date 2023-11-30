namespace TP11_ProyectoIntegral.Models;
public class DetalleCompra{
    public int IDCompra {get; set;}

    public int FKUsuario {get; set;}
    public int FKLibro {get; set;}

     public float Precio {get;set;}

    public int FKMetodoDePago {get; set;}
    public DateTime FechaYHora {get; set;}
    
   
    public DetalleCompra(){

    }
    public DetalleCompra(int IDCompra  = 0,int FKUsuario =0,int FKLibro = 0, float Precio = 0, int FKMetodoDePago = 0, DateTime FechaYHora = new DateTime()){
        this.IDCompra = IDCompra;
        this.FKUsuario = FKUsuario;
        this.FKLibro = FKLibro;
        this.Precio = Precio;
        this.FKMetodoDePago = FKMetodoDePago;
        this.FechaYHora = FechaYHora;

    }
}