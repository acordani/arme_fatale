class LandsController < ApplicationController
  before_action :set_land, only: [:show]
  def index
    @lands = Land.all
    @lands = @lands.where(city: params[:city]) if params["city"].present?
    @lands = @lands.where(neighborhood: params[:neighborhood]) if params["neighborhood"].present?
    @lands = @lands.where("surface >= ?", params[:min_surface]) if params["min_surface"].present?
    @lands = @lands.where("surface <= ?", params[:max_surface]) if params["max_surface"].present?
    # @land_coordinates = { lat: @land.latitude, lng: @land.longitude }
    # Let's DYNAMICALLY build the markers for the view.

    end




  def show
    @hash = Gmaps4rails.build_markers(@land) do |land, marker|
      marker.lat land.latitude
      marker.lng land.longitude
    end
  end

  def import
  Land.import(params[:file])
  redirect_to lands_path, notice: "Lands addes succesfully"
end

  private

  def set_land
    @land = Land.find(params[:id])
  end

  def land_params
    params.require(:land).permit(:number, :surface, :address, :neighborhood, :city, :latitude, :longitude)
  end
end
