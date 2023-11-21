using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP11_ProyectoIntegral.Models;
public class AccountController : Controller
{
    private readonly ILogger<AccountController> _logger;
    
       [HttpPost]
    public IActionResult registro(Usuario nuevoUsuario) {
         
        BD.RegistrarUsuario(nuevoUsuario);
        return RedirectToAction("Index", "Home");
    }

    public IActionResult olvide(string usuario, string contraseña) {
        BD.RecuperarContraseña(usuario, contraseña);
        return RedirectToAction("Index", "Home");
    }

    [HttpPost]
  public IActionResult login(string usuario, string contraseña) {
    if (BD.Login(usuario, contraseña)) {
        /*BD.user = null;*/ 
        
        /*esto deberia se = Usuario algo, pero esta mal hecho*/
        return  RedirectToAction("Index", "Home");
    }
    else { 
        return  RedirectToAction("Login", "Home", new {user = true});
    }
}

}