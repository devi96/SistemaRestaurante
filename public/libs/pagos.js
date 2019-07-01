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
}

function modal_events_pagos(){
  llenar_tabla_pagos_listar();
}
