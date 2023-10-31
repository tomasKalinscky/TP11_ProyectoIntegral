namespace TP11_ProyectoIntegral.Models;
public class Autor{
    public int IDAutor {get; set;}
    public string Nombre {get; set;}
    public string Biografia {get; set;}
    
    public Autor(){

    }
    public Autor(int IDAutor = 0, string Biografia = " ", string Nombre = ""){
        this.IDAutor = IDAutor;
        this.Nombre = Nombre;
        this.Biografia = Biografia;
    }
}