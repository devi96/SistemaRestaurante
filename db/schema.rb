# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_01_051104) do

  create_table "empleados", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "dni"
    t.string "password"
    t.string "rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mesas", force: :cascade do |t|
    t.integer "capacidad"
    t.string "estado"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordens", force: :cascade do |t|
    t.integer "pedido_id"
    t.integer "codigoOrden"
    t.integer "pago_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pagos", force: :cascade do |t|
    t.string "ruc"
    t.integer "codigo"
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "monto"
    t.string "moneda"
    t.string "estado"
    t.string "forma_pago"
    t.string "comprobante_pago"
    t.integer "mesa_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mesa_id"
    t.integer "platillo_id"
    t.string "estado"
    t.integer "cantidad"
    t.string "tiempo_espera"
    t.time "horaPedido"
  end

  create_table "platillos", force: :cascade do |t|
    t.string "nombre"
    t.float "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tipo_platillo"
  end

  create_table "reservacions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dni"
    t.string "nombresApellidos"
    t.string "regular"
    t.integer "mesa_id"
    t.string "tiempo_espera"
    t.time "horaReservacion"
    t.string "estado"
  end

end
