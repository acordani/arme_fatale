class LandsController < ApplicationController
  before_action :set_land, only: [:show]
  def index
    @lands = Land.all
  end

  def show

  end

  private

  def set_land
    @land = Land.find(params[:id])
  end

  def land_params
    params.require(:land).permit(:number, :surface, :address, :neighborhood, :city)
  end
end
