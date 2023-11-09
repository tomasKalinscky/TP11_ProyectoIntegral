namespace TP11_ProyectoIntegral.Models;
public class MetodoPago{
    public int IDMetodoPago{get;set;}
    public string MetodoPago{get;set;}
    
    public MetodoPago(){

    }
    public MetodoPago(int IDMetodoPago = 0,int MetodoPago = ""){
        this.IDMetodoPago=IDMetodoPago;
        this.MetodoPago=MetodoPago;
    }
}