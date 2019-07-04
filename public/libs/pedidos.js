$(window).ready(function (evt) {
  var _pedido_id;
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
            $tr += '<tr><td>' + item.id + '</td><td>'+ item.mesa_id + '</td><td>' + item.platillo_id + '</td><td>' + item.cantidad  + '</td><td>' + item.estado + '</td><td>' + item.tiempo_espera + '</td><td>' + item.costo + '</td><td>' + '<button' + ' id="Editar' + item.id + '" ' + 'class="btn_editar_pedido btn btn-primary">Editar</button> ' + '<button'+ ' id="Eliminar' + item.id +'" ' + ' class="btn_eliminar_pedido btn btn-danger">Eliminar</button>' +'</td></tr>';
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
        getPlatillos();
    }

  });
}
function getLlenarDataPedido(pedido_id){
 var _data = {
        IDpedido: pedido_id
      }

  $.ajax({
    url: HOST_NAME +'/getPedido',
    type: 'get',
    datatype: 'json',
    data: _data,
    contentType: "application/json",
    success: function(response, status, xhr){

      if (status == "success"){
        console.log("Se consiguio la data de pedido");
        console.log(response);
        _data = response.data

        //$("#IDmesa2 option[value='" + _data.mesa_id + "']").attr('selected', 'selected');
        //$("#estado2 option[value='" + _data.estado + "']").attr('selected', 'selected');
        $("#estado2").val(_data.estado)
        //$("#IDplatillo2 option[value='" + _data.platillo_id + "']").attr('selected', 'selected');
        $("#IDmesa2").val(_data.mesa_id);
        $("#IDplatillo2").val(_data.platillo_id);
        $("#cantidad_input2").val(_data.cantidad);
        $("#IDmesa2").select2().trigger('change');
        $("#IDplatillo2").select2().trigger('change');
      } else{
        console.log("No se encontro nada");
      }

    },
    error: function (responseData, textStatus, errorThrown) {
      console.log("hubo un error");
    },
    complete: function(){
        console.log("Termino de reservar");
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
          $("#IDmesa2").html($tr);
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
        $('.js-example-basic-single').select2();


      $(".btn_eliminar_pedido").click(function (evt) {
         var idt = evt.target.id;
        console.log("VALOR DEL PEDIDO: ");
      
        idt = idt.split("Eliminar")

        console.log(idt[1]);
        pedido_id = idt[1]

        _pedido_id = pedido_id

        var _modal = $("#modal-eliminar-pedido");
        _modal.modal("show");

      });


      $("#btn_eliminar_pedido_aceptar").click(function (evt) {
          eliminarPedido(_pedido_id);
      });

      $("#btn_actualizar_pedido_aceptar").click(function (evt) {
          actualizarPedido(_pedido_id);
      });

     


      $(".btn_editar_pedido").click(function (evt) {
          console.log("PRESIONO AQUI")
          var idt = evt.target.id;
          console.log("VALOR DEL PEDIDO: ");
      
          idt = idt.split("Editar")

        console.log(idt[1]);
        pedido_id = idt[1]

        _pedido_id = pedido_id

          var _modal = $("#modal-editar-pedido");
          _modal.modal("show");

          getLlenarDataPedido(_pedido_id);
      });




    }

  });
}
function actualizarPedido(pedido_id){
   var _data = {
        IDpedido: pedido_id,
        estado: $("#estado2 option:selected").val(),
        IDmesa: $("#IDmesa2 option:selected").val(),
        IDplatillo: $("#IDplatillo2 option:selected").val(),
        cantidad: $("#cantidad_input2").val()
      }

  $.ajax({
    url: HOST_NAME +'/actualizarPedido',
    type: 'post',
    datatype: 'json',
    data: JSON.stringify(_data),
    contentType: "application/json",
    success: function(response, status, xhr){

      if (status == "success"){
        console.log("Se actualizo el pedido con exito");
      } else{
        console.log("No se pudo actualizo");
      }

    },
    error: function (responseData, textStatus, errorThrown) {
      console.log("hubo un error");
    },
    complete: function(){
        console.log("Termino de actualizo");
        location.reload();
    }
  });

}

function eliminarPedido(pedido_id){
    var _data = {
        IDpedido: pedido_id
      }

  $.ajax({
    url: HOST_NAME +'/eliminarPedido',
    type: 'post',
    datatype: 'json',
    data: JSON.stringify(_data),
    contentType: "application/json",
    success: function(response, status, xhr){

      if (status == "success"){
        console.log("Se elimino el pedido con exito");
      } else{
        console.log("No se pudo eliminar");
      }

    },
    error: function (responseData, textStatus, errorThrown) {
      console.log("hubo un error");
    },
    complete: function(){
        console.log("Termino de eliminar");
        location.reload();
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
          $("#IDplatillo2").html($tr);
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
        getMesasOcupadas();
    }

  });
}


function create_pedido(){
  var _data = {
    IDmesa: $("#IDmesa option:selected").val(),
    IDplatillo: $("#IDplatillo option:selected").val(),
    cantidad: $("#cantidad_input").val()
  }
  $.ajax({
    url: HOST_NAME +'/createPedido',
    type: 'post',
    datatype: 'json',
    data: JSON.stringify(_data),
    contentType: "application/json",
    success: function(response, status, xhr){
      if (status == "success"){
        console.log("paso");
        //fill_table();
        $("#close_modal").click();
        console.log("Si se guardo")
      } else{
        console.log("No se guardo")
      }

    },
    error: function (responseData, textStatus, errorThrown) {
      console.log("hubo un error");
    },
    complete: function(){
      location.reload();
    }

  });

}






function modal_events_pedidos(){

  llenar_tabla_pedidos_listar();

  $("#buscar_text_pedido").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    llenar_tabla_pedidos_listar(value);
  });

$("#agregar_platillo").click(function (evt) {
    var _modal = $("#modal-agregar");
     _modal.modal("show");
    });


 $("#btn_save_AGREGAR").click(function (evt){
    console.log("crear pedido");
    create_pedido();
    console.log("se creo");
  });
 
}
