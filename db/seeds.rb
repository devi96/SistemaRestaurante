# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  Empleado.create([
    {nombre: "Harold",apellido: "De la cruz",dni:"75699485",password:"1234", rol:"mesero"},
    {nombre: "Alexis",apellido: "Vilchez",dni:"715615100",password:"4123", rol: "cajero"},
    {nombre: "Dani",apellido: "Luzmila",dni:"12345",password:"5451", rol: "chef"},
    {nombre: "Beto",apellido: "Ulloa",dni:"123456",password:"1451", rol: "admin"},
    {nombre: "Maricarmen",apellido: "Marin",dni:"1234567",password:"5415", rol: "mesero"}])

  Mesa.create([{capacidad:4,estado:"RESERVADO"},
    {capacidad:4,estado:"RESERVADO"},
    {capacidad:4,estado:"LIBRE"},
    {capacidad:4,estado:"OCUPADO"},
    {capacidad:4,estado:"LIBRE"},
    {capacidad:4,estado:"OCUPADO"},
    {capacidad:4,estado:"LIBRE"}])

  Reservacion.create([
    {dni: "75699485", nombresApellidos: "Harold alexis de la cruz vilchez", regular: "SI", mesa_id: 1, horaReservacion: "12:00:00", tiempo_espera: "01 h, 00 min y 00 seg", estado: "ACTIVO"},
    {dni: "75699481", nombresApellidos: "Harold2 alexis de la cruz vilchez", regular: "SI", mesa_id: 2, horaReservacion: "12:00:00", tiempo_espera: "00 h, 08 min y 00 seg", estado: "ACTIVO"}
])

  Platillo.create([{nombre:"HUANCAINA",precio: 50.50,tipo_platillo:"MENU"},
    {nombre:"HUANCAINA1",precio: 60.50,tipo_platillo:"MENU"},
    {nombre:"HUANCAINA2",precio: 70.50,tipo_platillo:"MENU"},
    {nombre:"HUANCAINA3",precio: 80.50,tipo_platillo:"MENU"},
    {nombre:"LIMONADA",precio: 90.50,tipo_platillo:"BEBIDA"}])
  
  #Pago.create([
  #  {mesa_id: 1,ruc:"2011200210",codigo:1,fecha:"2016-08-20",monto: 40.50, moneda:"SOLES",estado:"PAGADO",forma_pago:"TARJETA",comprobante_pago:"FACTURA"},
  #  {mesa_id: 1,ruc:"2011200210",codigo:2,fecha:"2016-08-20",monto: 40.50, moneda:"SOLES",estado:"NO PAGADO",forma_pago:"TARJETA",comprobante_pago:"FACTURA"},
  #  {mesa_id: 1,ruc:"2011200210",codigo:3,fecha:"2016-08-20",monto: 40.50, moneda:"SOLES",estado:"NO PAGADO",forma_pago:"TARJETA",comprobante_pago:"FACTURA"},
  #  {mesa_id: 2,ruc:"2011200210",codigo:4,fecha:"2016-08-20",monto: 40.50, moneda:"SOLES",estado:"NO PAGADO",forma_pago:"TARJETA",comprobante_pago:"FACTURA"},
  #  {mesa_id: 2,ruc:"2011200210",codigo:5,fecha:"2016-08-20",monto: 40.50, moneda:"SOLES",estado:"NO PAGADO",forma_pago:"TARJETA",comprobante_pago:"FACTURA"},
  #  {mesa_id: 3,ruc:"2011200210",codigo:6,fecha:"2016-08-20",monto: 40.50, moneda:"SOLES",estado:"NO PAGADO",forma_pago:"TARJETA",comprobante_pago:"FACTURA"}])

  # ESTADO: LISTO, PREPARADO, 
  Pedido.create([
        {mesa_id: 1,platillo_id: 1,estado:"EN ESPERA",cantidad: 3,horaPedido: "12:00:00",tiempo_espera: "01 h, 00 min y 00 seg"},
        {mesa_id: 1,platillo_id: 5,estado: "EN ESPERA",cantidad: 3,horaPedido: "12:00:00",tiempo_espera: "00 h, 20 min y 00 seg"},
        {mesa_id: 2,platillo_id: 3,estado: "EN ESPERA",cantidad: 3,horaPedido: "12:00:00",tiempo_espera: "00 h, 10 min y 40 seg"},
        {mesa_id: 3,platillo_id: 4,estado: "PREPARANDO",cantidad: 3,horaPedido: "12:00:00",tiempo_espera: "00 h, 05 min y 00 seg"},
        {mesa_id: 4,platillo_id: 2,estado: "LISTO",cantidad: 3,horaPedido: "12:00:00",tiempo_espera: "00 h, 08 min y 00 seg"}
    ])