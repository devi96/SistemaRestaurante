$(window).ready(function (evt) {
	window._table = $("#notifications_table");
	window._filter_order = 0;
	window._system_id = $("#system_id").val();
	console.log(typeof _system_id);

	//fill_configuration();
	modal_events();
	//fill_vehicles();
});




function modal_events(){

	$("#agregar_platillo").on('click',function(){
		var _modal = $("#modal-agregar");
		_modal.modal("show");
	});

	$("#btn-save_A").click(function (evt){
		console.log("crear pedido");
		create_pedido();
		console.log("se creo");
	});

};
