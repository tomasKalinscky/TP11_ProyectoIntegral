// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function MostrarInfoLibro(IDS){
    $.ajax({
        type:'POST',
        dataType: 'JSON',
        url: '/Home/VerDetalleLibroAjax',
        data: {IDLibro: IDS},
        success:
            function (response){
                console.log(response);
                $("#TituloLibro").html("Detalle del libro" + response.titulo);

                let texto = "<p> Año de estreno: " +response.añoInicio + "<br>";
                texto+= "Sintesis: " + response.descripcion + "<br>";
                texto+= "Fecha de publicacion: " + response.fechaDePublicacion+ "<br>";
                texto+= "Stock actual: " + response.stock+ "<br>";
                texto+= "Precio: " + response.precio+ "<br>";
                texto+= "<img src='" + response.foto + "' class='img-fluid '></p>";
                $("#infoSerie").html(texto);
            },
            error : function(xhr,status){
                alert("Disculpe, hubo un problema, Matias Aboudara hizo algo mal");
            },
            complete: function(xhr,status){
                console.log('Peticion realizada')
            }
    })
}