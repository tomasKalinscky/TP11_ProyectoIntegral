using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP11_ProyectoIntegral.Models;
public class AccountController : Controller
{
    private readonly ILogger<AccountController> _logger;
    
       [HttpPost]
    public IActionResult registro(Usuario nuevoUsuario) {
         
        BD.RegistrarUsuario(nuevoUsuario);
        return View("Index");
    }

    public IActionResult olvide(string usuario, string contraseña) {
        BD.RecuperarContraseña(usuario, contraseña);
        return RedirectToAction("Index", "Home");
    }

    [HttpPost]
  public IActionResult login(string usuario, string contraseña) {
    if (BD.Login(usuario, contraseña)) {
        return  RedirectToAction("Bienvenida", "Home", new {pusuario = usuario});
    }

    return RedirectToAction("Index", "Home", new {user = true});
}

}