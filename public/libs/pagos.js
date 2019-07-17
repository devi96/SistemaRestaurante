$(window).ready(function (evt) {
  var _pagos_id;
  modal_events_pagos();
});


function llenar_tabla_pagos_listar(textAbuscar){
      var _data = {
        text_buscar: textAbuscar
      }
  $.ajax({
    url: HOST_NAME +'/buscarPagos',
    type: 'get',
    datatype: 'json',
    data: _data,
    contentType: "application/json",
    success: function(response, status, xhr){
      var costo_total = 0;
      if (status == "success"){
        console.log("Se devolvio exitosamente los pagos");
        //fill_table();
        var $tr="";


        $(function() {

          $.each(response, function(i, item){
            $tr += '<tr><td>' + item.id + '</td><td>'+ item.mesa_id + '</td><td>' + item.codigo + '</td><td>' + item.ruc  + '</td><td>' + item.monto + '</td><td>' + item.moneda + '</td><td>' + item.estado + '</td><td>' + item.forma_pago + '</td><td>'+ item.comprobante_pago +'</td><td>' + '<button'+ ' id="registroPago' + item.id +'" ' + ' class="btn_registrar_pago btn btn-primary">Registrar pago </button>' +'</td></tr>';
          });
          $("#tabla_pago_listar > tbody").html($tr);
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
        setTimeout("modals_buttons_pago()",150);
        console.log("PORQUE");
    }
  });
};
function modals_buttons_pago(){

      $(".btn_registrar_pago ").click(function (evt){
         var idt = evt.target.id;
        console.log("VALOR DEL PAGO: ");
      
        idt = idt.split("registroPago")

        console.log(idt[1]);
        pagos_id = idt[1]
        _pagos_id = pagos_id


        var _modal = $("#modal-pagar_pagos");
        _modal.modal("show");

      });

      $("#btn_pago_aceptar").click(function (evt){
        console.log("valor de pago id");
        console.log(_pagos_id);
        registroPago(_pagos_id);
      });
};

function registroPago(pagos_id){

  var _data = {
      pago_id: pagos_id,
      estado: $("#estado_pago").val(),
      forma_pago: $("#forma_pago").val(),
      comprobante_pago: $("#comprobante_pago").val(),
      ruc: $("#ingresar_ruc").val()
  }

  $.ajax({
    url: HOST_NAME +'/registroPago',
    type: 'post',
    datatype: 'json',
    data: JSON.stringify(_data),
    contentType: "application/json",
    success: function(response, status, xhr){
    
      if (status == "success"){
        console.log("Se registro con exito el pago");
        //fill_table();
        console.log(response);
      } else{
        console.log("No se guardo");
      }
      var _modal = $("#modal-pagar_pagos");
        _modal.modal("hide");

    },
    error: function (responseData, textStatus, errorThrown) {
      console.log("hubo un error");
      toastr.error('Ocurrio un error tipo:' + responseData.responseJSON.msj, 'Error');

    },
    complete: function(){
        console.log("Se termino");
        //location.reload();
        llenar_tabla_pagos_listar();

    }
  });

};

function modal_events_pagos(){
  llenar_tabla_pagos_listar();
}
