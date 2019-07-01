$(window).ready(function (evt) {
  var _mesa_id = 1;

	modal_events();
	//fill_vehicles();
});

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

    }

  });

}
function llenar_tabla_pedidos(mesa_id){
      var _data = {
        IDmesa: mesa_id
      }
  $.ajax({
    url: HOST_NAME +'/getAllpedidosActivosMesa',
    type: 'post',
    datatype: 'json',
    data: JSON.stringify(_data),
    contentType: "application/json",
    success: function(response, status, xhr){
      var costo_total = 0;
      if (status == "success"){
        console.log("Se devolvio exitosamente los pedidos");
        //fill_table();
        var $tr="";


        $(function() {

          $.each(response, function(i, item){
            $tr += '<tr><td>' + item.id + '</td><td>' + item.platillo_id + '</td><td>' + item.cantidad  + '</td><td>' + item.estado + '</td><td>' + item.tiempo_espera + '</td><td>' + item.costo + '</td> </tr>';
            costo_total = costo_total + parseFloat(item.costo);
          });
          $("#CostoTotal").html(costo_total);
          $(".tabla_pedidos > tbody").html($tr);
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

function cambiarEstadoMesa(mesa_id){
    var _data = {
        IDmesa: mesa_id,
        estado: $("#tipo_estado_mesa option:selected").val()
      }

  $.ajax({
    url: HOST_NAME +'/cambiarEstadoMesa',
    type: 'post',
    datatype: 'json',
    data: JSON.stringify(_data),
    contentType: "application/json",
    success: function(response, status, xhr){
      var costo_total = 0;
      if (status == "success"){
        console.log("Se actualizo exitosamente la mesa");
        console.log(response);
      } else{
        console.log("No se guardo");
      }
      location.reload();
    },
    error: function (responseData, textStatus, errorThrown) {
      console.log("hubo un error");
    },
    complete: function(){
        console.log("Termino de actualizar");
    }
  });
}
function reservarMesa(mesa_id){
    var _data = {
        IDmesa: mesa_id,
        nombre: $("#NOMBRE_INPUT").val(),
        dni: $("#DNI_INPUT").val()
      }

  $.ajax({
    url: HOST_NAME +'/reservarMesa',
    type: 'post',
    datatype: 'json',
    data: JSON.stringify(_data),
    contentType: "application/json",
    success: function(response, status, xhr){
      var costo_total = 0;
      if (status == "success"){
        console.log("Se actualizo exitosamente la reservacion");
        console.log(response);
        $("#mensaje_de_error").html("");
        location.reload();
      } else{
        console.log("No se guardo");
      }

    },
    error: function (responseData, textStatus, errorThrown) {
      console.log("hubo un error");
      console.log(responseData.responseJSON.msg);
      $("#mensaje_de_error").html(responseData.responseJSON.msg);
    },
    complete: function(){
        console.log("Termino de reservar");
    }
  });
}

function llenar_inputs_reservacion(mesa_id){
    var _data = {
        IDmesa: mesa_id
      }

  $.ajax({
    url: HOST_NAME +'/getReservacion',
    type: 'get',
    datatype: 'json',
    data: _data,
    contentType: "application/json",
    success: function(response, status, xhr){

      if (status == "success"){
        console.log("Se actualizo exitosamente la reservacion");
        console.log(response);
        _data = response.data
        $("#NOMBRE_INPUT").val(_data.nombre);
        $("#DNI_INPUT").val(_data.dni);

      } else{
        console.log("No se encontro nada");
           $("#NOMBRE_INPUT").val("");
        $("#DNI_INPUT").val("");

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


function modal_events(){
  //evento para las listas
$(".tab_lista").on('click','li', function() {
        $('.tab_lista li.active').removeClass('active');
        $(this).addClass('active');
 });


  //botones de modal en modulo mesas
  $(".btn_estados").click(function( evt) {

    var idt = evt.target.id;

    console.log("VALOR DE LA MESA: ");
    
    idt = idt.split("MESA_ESTADO")

    console.log(idt[1]);
    mesa_id = idt[1]

    _mesa_id = mesa_id


    var _modal = $("#modal-estado");
    _modal.modal("show");
  });

  $("#btn_aceptar_status").click(function(evt){
    var _btn_id = _mesa_id
    cambiarEstadoMesa(_btn_id);
    var _modal = $("#modal-estado");
    _modal.modal("hide");

  });

  $("#btn_cancelar_status").click(function(evt){
   var _modal = $("#modal-estado");
    _modal.modal("hide");
  });



  $(".btn_pagos").click(function (evt){

    var idt = evt.target.id;
    console.log("VALOR DE LA MESA: ");
  
    idt = idt.split("MESA_PAGO")

    console.log(idt[1]);
    mesa_id = idt[1]

    _mesa_id = mesa_id

    llenar_tabla_pedidos(mesa_id);

    var _modal = $("#modal-pagar");
    _modal.modal("show");
  });


  $(".btn_reservacion").click(function (evt){
      var idt = evt.target.id;
    console.log("VALOR DE LA MESA: ");
    $("#mensaje_de_error").html("");
    idt = idt.split("MESA_RESERVACION");

    console.log(idt[1]);
    mesa_id = idt[1];

    _mesa_id = mesa_id;

    llenar_inputs_reservacion(_mesa_id);

    var _modal = $("#modal-reservacion");
    _modal.modal("show");
    
  });

  //----------------end-----------------------

  $("#btn_reservacion_aceptar").click(function (evt) {
     var _btn_id = _mesa_id
    reservarMesa(_btn_id);

  })


  $("#agregar_platillo").click(function (evt) {

    var _modal = $("#modal-agregar");
    _modal.modal("show");

  });

  $("#BOTON_EDITAR").click(function (evt) {

    var _modal = $("#modal-editar");
    _modal.modal("show");

  });


  $("#btn-save_R").click(function (evt) {

    var _modal = $("#modal-reservacion");
    _modal.modal("show");

  });
  $("#REGISTRO_PAGO").click(function( evt) {
    var _modal = $("#modal-pagar_pagos");
    _modal.modal("show");
  });


  $("#btn_save_AGREGAR").click(function (evt){
    console.log("crear pedido");
    create_pedido();
    console.log("se creo");
  });
  

}
