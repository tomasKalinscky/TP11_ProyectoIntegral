using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP11_ProyectoIntegral.Models;
using System.Collections.Generic;

namespace TP11_ProyectoIntegral.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    public IActionResult CerrarSesion(){
        BD.user = null;
        return View("login");
    }
    public IActionResult login(bool user=false){
        
        ViewBag.usuarioEstaMal = user;
        return View();
    }
    public IActionResult Creditos(){
        return View();
    }
    public IActionResult perfil(){
        if (BD.user != null)
        ViewBag.InfoUsuario = BD.user;
        else {
            return View("login");
        }
        return View();
    }
    public IActionResult Historial(){
        return View();
    }
    public IActionResult bibloteca(){
        return View();
    }
    public IActionResult Index()
    {

        ViewBag.Libros = BD.ListarLibrosYFiltros();
        return View();
    }
    public IActionResult ComprarLibro(int IDLibro){
        if (BD.user != null)
        ViewBag.InfoLibro = BD.DetalleLibro(IDLibro);
        else {
            return View("login");
        }
        
        return View();
    }
        public IActionResult Olvide(){
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
     public Libro VerDetalleLibroAjax(int IDLibro)
    { 
        return BD.DetalleLibro(IDLibro);
    }
    
}
