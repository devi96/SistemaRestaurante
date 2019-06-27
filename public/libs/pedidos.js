$(window).ready(function (evt) {
  llenar_tabla_pedidos_listar()
	modal_events_pedidos();
});

function llenar_tabla_pedidos_listar(textAbuscar){
      var _data = {
        IDmesa: textAbuscar
      }

  $.ajax({
    url: HOST_NAME +'/buscarPedido',
    type: 'get',
    datatype: 'json',
    data: _data,
    contentType: "application/json",
    success: function(response, status, xhr){
      var costo_total = 0;
      if (status == "success"){
        console.log("Se devolvio exitosamente los pedidos");
        //fill_table();
        var $tr="";


        $(function() {

          $.each(response, function(i, item){
            $tr += '<tr><td>' + item.id + '</td><td>'+ item.mesa_id + '</td><td>' + item.platillo_id + '</td><td>' + item.cantidad  + '</td><td>' + item.estado + '</td><td>' + item.tiempo_espera + '</td><td>' + item.costo + '</td> </tr>';
          });
          $("#tabla_pedidos_listar > tbody").html($tr);
        }); 

        console.log(response);
      } else{
        console.log("No se guardo");
      }

    },
    error: function (responseData, textStatus, errorThrown) {
      console.log("hubo un error");
    },
    complete: function(){
        console.log("Termino de llenar la tabla");
    }

  });
}

function getMesasOcupadas(){

  $.ajax({
    url: HOST_NAME +'/getMesasOcupadas',
    type: 'get',
    datatype: 'json',
    contentType: "application/json",
    success: function(response, status, xhr){
      
      if (status == "success"){
        console.log("Se devolvio exitosamente las mesas");

        $(function() {

          var $tr="";
          $.each(response, function(i, item){
            $tr += '<option value="'+ item.id + '"">' + item.id + '</option>';
          });

          $("#IDmesa").html($tr);
        }); 

        console.log(response);
      } else{
        console.log("No se guardo");
      }

    },
    error: function (responseData, textStatus, errorThrown) {
      console.log("hubo un error");
    },
    complete: function(){
        console.log("Termino de llenar la tabla");
       
    }

  });
}


function getPlatillos(){

  $.ajax({
    url: HOST_NAME +'/getPlatillos',
    type: 'get',
    datatype: 'json',
    contentType: "application/json",
    success: function(response, status, xhr){
      if (status == "success"){
        console.log("Se devolvio exitosamente los platillos para el select");
        var $tr="";
        $(function(){

            $.each(response, function(i, item){
            $tr += '<option value="'+ item.id + '">' + item.nombre + '</option>';
          });

          $("#IDplatillo").html($tr);
        }); 

        console.log(response);
      } else{
        console.log("No se guardo");
      }

    },
    error: function (responseData, textStatus, errorThrown) {
      console.log("hubo un error");
    },
    complete: function(){

    }

  });
}

function modal_events_pedidos(){

  $("#buscar_text_pedido").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    llenar_tabla_pedidos_listar(value);
  });

  setTimeout("getPlatillos();", 200);
  setTimeout("getMesasOcupadas();", 200);
  $('.js-example-basic-single').select2();
  
}
