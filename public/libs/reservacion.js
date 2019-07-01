$(window).ready(function (evt) {
  var _reservacion_id;
  modal_events_reservacion();
});


function llenar_tabla_pedidos_listar(textAbuscar){
      var _data = {
        dni: textAbuscar
      }

  $.ajax({
    url: HOST_NAME +'/buscarReservacion',
    type: 'get',
    datatype: 'json',
    data: _data,
    contentType: "application/json",
    success: function(response, status, xhr){
      var costo_total = 0;
      if (status == "success"){
        console.log("Se devolvio exitosamente las reservaciones");
        //fill_table();
        var $tr="";


        $(function() {

          $.each(response, function(i, item){
            $tr += '<tr><td>' + item.id + '</td><td>'+ item.mesa_id + '</td><td>' + item.dni + '</td><td>' + item.nombres  + '</td><td>' + item.tiempo_espera + '</td><td>' + '<button'+ ' id="EliminarR' + item.id +'" ' + ' class="btn_eliminar_reservacion btn btn-danger">Eliminar</button>' +'</td></tr>';
          });
          $("#tabla_reservaciones_listar > tbody").html($tr);
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
        setTimeout("modals_buttons()",150);
        console.log("PORQUE");
    }
  });
};
function modals_buttons(){

      $(".btn_eliminar_reservacion").click(function (evt){
         var idt = evt.target.id;
        console.log("VALOR DE LA RESERVACION: ");
      
        idt = idt.split("EliminarR")

        console.log(idt[1]);
        reservacion_id = idt[1]

        _reservacion_id = reservacion_id

        var _modal = $("#modal-eliminar-reservacion");
        _modal.modal("show");

      });

      $("#btn_eliminar_reservacion_aceptar").click(function (evt) {
          eliminarReservacion(_reservacion_id);
      });

}

function eliminarReservacion(reservacion_id){
    var _data = {
        IDreservacion: reservacion_id
      }

  $.ajax({
    url: HOST_NAME +'/eliminarReservacion',
    type: 'post',
    datatype: 'json',
    data: JSON.stringify(_data),
    contentType: "application/json",
    success: function(response, status, xhr){

      if (status == "success"){
        console.log("Se elimino la reservacion con exito");
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


function modal_events_reservacion(){

  llenar_tabla_pedidos_listar();

  $("#buscar_text_reservacion").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    llenar_tabla_pedidos_listar(value);
  });

  


}
