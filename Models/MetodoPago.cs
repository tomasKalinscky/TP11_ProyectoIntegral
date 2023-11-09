namespace TP11_ProyectoIntegral.Models;
public class MetodoPago{
    public int IDMetodoPago{get;set;}
    public string MetodoDePago{get;set;}
    
    public MetodoPago(){

    }
    public MetodoPago(int IDMetodoPago = 0,string MetodoDePago = ""){
        this.IDMetodoPago=IDMetodoPago;
        this.MetodoDePago=MetodoDePago;
    }
}