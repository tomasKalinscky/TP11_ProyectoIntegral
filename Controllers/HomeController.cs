using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP11_ProyectoIntegral.Models;

namespace TP11_ProyectoIntegral.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    public IActionResult login(){
        return View();
    }
    public IActionResult Creditos(){
        return View();
    }
    public IActionResult perfil(){
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
