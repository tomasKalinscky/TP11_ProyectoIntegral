namespace TP11_ProyectoIntegral.Models;
public class Usuario{
    public int IDUsuario {get; set;}
    public string NombreUsuario {get; set;}
    public string Contraseña {get; set;}
    public string Gmail {get; set;}
    public string Telefono {get; set;}
    public Usuario(){

    }
    public Usuario(int IDUsuario = 0,string NombreUsuario = "",string Contraseña ="",string Gmail = null,string Telefono = ""){
        this.IDUsuario = IDUsuario;
        this.NombreUsuario = NombreUsuario;
        this.Contraseña = Contraseña;
        this.Gmail = Gmail;
        this.Telefono = Telefono;

    }
}