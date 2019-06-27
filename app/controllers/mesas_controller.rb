class MesasController < ApplicationController
  def ver
    @mesas = Mesa.all
  end
  def reservacion
  end

  def getOcupadas
  	@mesas = Mesa.where(estado:"OCUPADO")
  	render json: @mesas, status: :ok
  end
end
