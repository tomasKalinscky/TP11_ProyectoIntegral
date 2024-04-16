/*function toggleColor() {
    var boton = document.getElementById("miBoton");
    var estadoInput = document.getElementById("estadoBoton");
  
    if (boton.classList.contains("presionado")) {
      boton.classList.remove("presionado");
      estadoInput.value = "false";
    } else {
      boton.classList.add("presionado");
      estadoInput.value = "true";
    }
  }
  */
  function toggleColor() {
    let aux = document.getElementById("estadoBoton").value;
    if(aux == "false")
    {
        document.getElementById("estadoBoton").value = "true";
        console.log(document.getElementById("estadoBoton").value);
    }
    else
    {
        document.getElementById("estadoBoton").value = "false";
        console.log(document.getElementById("estadoBoton").value);
    }
}
  
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
                console.log(response.genero);
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
        url: '/Home/MostrarHistorialCompras',
        data: {IDUsuario: IDS},
        success:
            function (response){
                console.log(response);
                let texto='<table class="table"><thead><tr><th scope="col">#</th><th scope="col">Titulo</th><th scope="col">Fecha de compra</th></tr></thead><tbody>';
                let aux = 1;
                if ((response.length)>0) {
                    response.forEach(element => {
                        texto = texto +`<tr><th scope="row">${aux}</th><td>${element.titulo}</td><td>${element.fecha.substring(0,10)}</td></tr>`;
                        aux++;
                    });
                }
                else{
                    texto=texto + "No tiene ninguna compra todavia";
                }
               
                texto= texto + "</tbody></table>";
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

/*

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>

*/










/*function ElegirMetodoPago(){
    $.ajax({
        type:'GET',
        dataType: 'JSON',
        url: '/Home/ElegirMetodoPago',
        data: {},
        success:
            function (response){
                console.log(response);
                $("#TituloPago").html("Metodo de pago");
                let texto='';
                for (const metodosDePago of response) 
                {
                    texto += `<input type="radio" name="FKMetodoDePago" value="${metodosDePago.idMetodoPago}" required>${metodosDePago.metodoDePago} ${metodosDePago.idMetodoPago}<br> `;
                }       
                $("#infoPago").html(texto);
                
            },
            error : function(xhr,status){
                alert("Disculpe, hubo un problema, Matias Aboudara hizo algo mal");
            },
            complete: function(xhr,status){
                console.log('Peticion realizada')
            }
    });
}
*/


/*  
    <input type="radio" name="FKMetodoDePago">Tarjeta de Credito
    <input type="radio" name="FKMetodoDePago">Tarjeta de Debito
    <input type="radio" name="FKMetodoDePago">Efectivo
    <input type="radio" name="FKMetodoDePago">MercadoPago QR
    <input type="radio" name="FKMetodoDePago">MercadoPago Transferencia
  </form>*/ 
  function validarFormulario() {
    let password = document.getElementById("Contrasena").value;
    let confirmPassword = document.getElementById("Contrasena2").value;
  
    var caracterEspecial = /[$&+,:;=?@#|'<>.^*()%!-]/.test(password);
  
    /*if (!caracterEspecial) {
        document.getElementById("mensajeError").innerHTML = "La contraseña debe contener al menos un carácter especial.";
        return false;
    } */
  
    if (password.length < 8) {
        document.getElementById("mensajeError").innerHTML = "La contraseña debe tener al menos 8 caracteres.";
        return false;
    }
  
    if (confirmPassword !== password) {
        document.getElementById("mensajeError").innerHTML = "Las contraseñas no coinciden. Por favor, inténtelo de nuevo.";
        document.getElementById("Contrasena2").value = "";
        return false;
    }
    return true;
  }