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
                let texto = "<p><img src='" + response.imagen + "' class='img-fluid '></p>";
                texto+= `<p>Genero: ${response.genero}</p>`;
                texto+= "<p>Autor: " + response.nombreAutor+ "</p>";
                texto+= "<p>Sintesis: " + response.descripcion + "</p>";
                texto+= "<p>Fecha de publicacion: " + response.fechaDePublicacion.substring(0,10)+ "</p>";
                texto+= "<p>Stock actual: " + response.stock+ "</p>";
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