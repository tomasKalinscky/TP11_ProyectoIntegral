function MostrarInfoLibro(IDS)
{
    $.ajax({
        type:'GET',
        dataType: 'JSON',
        url: '/Home/VerDetalleLibroAjax',
        data: {IDLibro: IDS},
        success:
            function (response){
                console.log(response);
                $("#TituloLibro").html("Detalle del libro: " + response.titulo);
                let texto = "<div class='sm'><img src='" + response.imagen + "' class='saberMasimg'></div><br>";
                texto+= `<p>Genero: ${response.genero}<br>`;
                texto+= "Autor: " + response.nombreAutor+ "<br>";
                texto+= "Sintesis: " + response.descripcion + "<br>";
                texto+= "Fecha de publicacion: " + response.fechaDePublicacion.substring(0,10)+ "<br>";
                texto+= "Stock actual: " + response.stock+ "<p>";
                $("#infoLibro").html(texto);
            },
            error : function(xhr,status){
                alert("Disculpe, hubo un problema, Matias Aboudara hizo algo mal");
            },
            complete: function(xhr,status){
                console.log('Peticion realizada')
            }
    });
}
function MostrarHistorialCompras(IDS)
{
    $.ajax({
        type:'GET',
        dataType: 'JSON',
        url: '/Home/VerHistorialAjax',
        data: {IDUsuario: IDS},
        success:
            function (response){
                console.log(response);
                let texto="<p> hola " + response.tituloLibro + "</p>"
                $("#infoHistorial").html(texto);
            },
            error : function(xhr,status){
                alert("Disculpe, hubo un problema, Matias Aboudara hizo algo mal");
            },
            complete: function(xhr,status){
                console.log('Peticion realizada')
            }
    });
}
