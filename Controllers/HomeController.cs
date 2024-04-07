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
        public IActionResult BuscarLibro(string loquepongaenelbuscador)
    {

        ViewBag.Libros = BD.BuscarLibro(loquepongaenelbuscador);
        if(ViewBag.Libros.Count == 0)
        {
            ViewBag.error = $"No se a encontrado un libro que contenga '{loquepongaenelbuscador}' ";
        }
        return View("librobuscado");
    }
    public IActionResult Index()
    {

        ViewBag.Libros = BD.ListarLibrosYFiltros();
        return View();
    }
    public IActionResult ComprarLibro(int IDLibro){
        ViewBag.errorCompra = false;
        ViewBag.compraExitosa = false;
        if (BD.user != null)
        {
            ViewBag.MetodoPago = BD.ListarMetodoDePago();
            ViewBag.InfoLibro = BD.DetalleLibro(IDLibro);
            ViewBag.Usuario = BD.user;
        }
        else {
            return View("login");
        }
        
        return View();
    }
        public IActionResult Olvide(){
        return View();
    }
    public IActionResult AgregarLibro(){
        if (BD.user != null){
            return View();
        }
        else{
            return View("login");
        }
        
    }
    
    [HttpPost] public IActionResult AgregarLibro(string Titulo, string Descripcion, DateTime FechaDePublicacion, int Stock, string Imagen, float Precio, string NombreAutor, string Genero) {
    int FKAutor,FKGenero;
    FKAutor = BD.BuscarIDAutor(NombreAutor);
    FKGenero =BD.BuscarIDGenero(Genero);
    BD.AgregarLibro(Titulo,FKGenero,Descripcion,FechaDePublicacion,FKAutor,Stock,Imagen,Precio);
    return RedirectToAction("Index");
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

    public IActionResult guardarCompra(DetalleCompra com) {
        bool compraGuardada = BD.guardarCompra(com);
        ViewBag.compraExitosa = false;
        ViewBag.errorCompra = false;
        if (compraGuardada) {
            ViewBag.compraExitosa = true;
        }
        else {
            ViewBag.errorCompra = true;
        }
        ViewBag.MetodoPago = BD.ListarMetodoDePago();
        ViewBag.InfoLibro = BD.DetalleLibro(com.FKLibro);
        ViewBag.Usuario = BD.user;
        return View("comprarLibro");
    }

    public List<Historial> MostrarHistorialCompras(int IDUsuario){
        return BD.ObtenerHistorial(IDUsuario);
    }
    public List<MetodoPago> ElegirMetodoPago(){
        return BD.ListarMetodoDePago();
    }

}