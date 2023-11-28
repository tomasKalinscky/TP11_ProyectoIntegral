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
            ViewBag.error = $"No se a encontrado un libro que contega la palabra '{loquepongaenelbuscador}' ";
        }
        return View("librobuscado");
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
    public IActionResult AgregarLibro(){
        if (BD.user != null){
            return View();
        }
        else{
            return View("login");
        }
        
    }/*
    [HttpPost] public IActionResult GuardarLibro(string Genero, DateTime FechaDePublicacion, int IDPartido, string Apellido, string Nombre, string Foto, string Postulacion) {
    Libro lib = new Libro(IDCandidato, IDPartido, Apellido, Nombre, FechaNacimiento, Foto, Postulacion);
    BD.AgregarLibro(lib);
    return RedirectToAction("VerDetallePartido", new {IDPartido = can.IDPartido});
}
 <input type="text" name="Titulo" placeholder="Titulo" required>
        <input type="text" name="Genero" placeholder="Genero" required>
        <input type="date" name="FechaDePublicacion" required>
        <input type="text" name="Imagen" placeholder="Link a la foto" required>
        <input type="text" name="Autor" placeholder="nombre del autor" required>
        <input type="text" name="Stock" placeholder="Ponga el stock a agregar" required>
        <input type="text" name="Descripcion" placeholder="Ponga una breve descripcion"required>
        <button type="sumbit">Agregar libro</button>*/
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

    public List<MetodoPago> elegirMetodoPago() {
        return BD.obtenerMetodosPago();
    }
    public List<Historial> MostrarHistorialCompras(int IDUsuario){
        return BD.ObtenerHistorial(IDUsuario);
    }
    public List<MetodoPago> ElegirMetodoPago(){
        return BD.ListarMetodoDePago();
    }
}
