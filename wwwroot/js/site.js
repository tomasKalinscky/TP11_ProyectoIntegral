function MostrarInfoLibro(IDS)
{
    $.ajax({
        url: '/Home/VerDetalleLibroAjax',
        type:'GET',
        dataType: 'JSON',
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
            complete: function(xhr,status){
                console.log('Peticion realizada')
            }
    })
}
