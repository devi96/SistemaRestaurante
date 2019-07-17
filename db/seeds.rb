# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  Empleado.create([
    {nombre: "Harold",apellido: "De la cruz",dni:"75699485",password:"1234", rol:"mesero"},
    {nombre: "Alexis",apellido: "Vilchez",dni:"71561510",password:"4123", rol: "cajero"},
    {nombre: "Dani",apellido: "Luzmila",dni:"012345427",password:"5451", rol: "chef"},
    {nombre: "Beto",apellido: "Ulloa",dni:"12345786",password:"1451", rol: "admin"},
    {nombre: "Maricarmen",apellido: "Marin",dni:"23154567",password:"5415", rol: "mesero"}])

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

  Platillo.create([{nombre:"HUANCAINA",precio: 10.50,tipo_platillo:"MENU"},
    {nombre:"SOPA SIU KAO",precio: 12.50,tipo_platillo:"MENU"},
    {nombre:"SOPA WAN TAN",precio: 15.50,tipo_platillo:"MENU"},
    {nombre:"SOPA WAN TAN ESPECIAL",precio: 18.00,tipo_platillo:"MENU"},
    {nombre:"SOPA FUCHIFU",precio: 20.50,tipo_platillo:"MENU"},
    {nombre:"SOPA DE ESPARRAGOS",precio: 40.50,tipo_platillo:"MENU"},
    {nombre:"TALLARÍN CON POLLO",precio: 30.50,tipo_platillo:"MENU"},
    {nombre:"CHAUFA CON POLLO",precio: 8.00,tipo_platillo:"MENU"},
    {nombre:"CHAUFA CON CERDO",precio: 9.50,tipo_platillo:"MENU"},
    {nombre:"COMBINADO CON POLLO",precio: 10.50,tipo_platillo:"MENU"},
    {nombre:"CERDO CON TAMARINDO Y CHAUFA",precio: 9.50,tipo_platillo:"MENU"},
    {nombre:"POLLO CON VERDURAS Y CHAUFA",precio: 9.50,tipo_platillo:"MENU"},
    {nombre:"POLLO CON TAMARINDO Y CHAUFA",precio: 19.50,tipo_platillo:"MENU"},
    {nombre:"CERDO CON VERDURAS Y CHAUFA",precio: 18.50,tipo_platillo:"MENU"},
    {nombre:"CHUEPIKAY Y CHAUFA",precio: 22.00,tipo_platillo:"MENU"},
    {nombre:"KAMLU WANTÁN Y CHAUFA",precio: 28.50,tipo_platillo:"MENU"},
  {nombre:"ALITAS CON VERDURAS Y CHAUFA",precio: 13.00,tipo_platillo:"MENU"},
{nombre:"TAYPÁ Y CHAUFA",precio: 28.00,tipo_platillo:"MENU"},
{nombre:"POLLO CON FREJOLITO Y CHAUFA",precio: 18.00,tipo_platillo:"MENU"},
{nombre:"AEROPUERTO CON POLLO",precio: 19.00,tipo_platillo:"MENU"},
{nombre:"CARNE CON VERDURAS",precio: 20.50,tipo_platillo:"MENU"},
{nombre:"TALLARÍN CON CHANCHO",precio: 17.50,tipo_platillo:"MENU"},
{nombre:"TALLARÍN CON POLLO EN TROZOS ",precio: 16.50,tipo_platillo:"MENU"},
{nombre:"LUN FU KAY",precio: 18.50,tipo_platillo:"MENU"},
{nombre:"KAM LU WANTÁN",precio: 11.50,tipo_platillo:"MENU"},
{nombre:"CERDO CON TAMARINDO",precio: 12.50,tipo_platillo:"MENU"},
{nombre:"CHIJAUKAY",precio: 13.50,tipo_platillo:"MENU"},
{nombre:"TÉ (TAZA)",precio: 17.50,tipo_platillo:"BEBIDA"},
{nombre:"TÉ (TETERA)",precio: 18.50,tipo_platillo:"BEBIDA"},
{nombre:"LIMONADA (JARRA)",precio: 22.00,tipo_platillo:"BEBIDA"},
{nombre:"CHICHA MORADA O MARACUYA (JARRA)",precio: 25.50,tipo_platillo:"BEBIDA"},
{nombre:"AGUA MINERAL",precio: 30.80,tipo_platillo:"BEBIDA"},
{nombre:"GASEOSA MEDIANA",precio: 24.50,tipo_platillo:"BEBIDA"},
{nombre:"GASEOSA PERSONAL (DESCARTABLE)",precio: 11.50,tipo_platillo:"BEBIDA"},
{nombre:"KGASEOSA 1 1/2 LT (DESCARTABLE)",precio: 15.50,tipo_platillo:"BEBIDA"},
{nombre:"CAFÉ (TAZA)",precio: 19.50,tipo_platillo:"BEBIDA"},
{nombre:"INFUSIONES: TE/ANÍS/MANZANILLA (TAZA)",precio: 30.50,tipo_platillo:"BEBIDA"},
{nombre:"CERVEZA PERSONAL",precio: 14.00,tipo_platillo:"BEBIDA"},
{nombre:"CERVEZA NEGRA PERSONAL",precio: 33.50,tipo_platillo:"BEBIDA"}])
  
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