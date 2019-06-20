class MesasController < ApplicationController
  def ver
    @mesas = Mesa.all
  end
  def reservacion
  end
end
