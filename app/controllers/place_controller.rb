class PlaceController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      // TODO Save action here
      flash[:notice] = "Your place was created successfully."
    else
      // TODO error action here
      flash[:alert] = "There was an error creating this place."
    end

  end

  def update
    @place = Place.find(params[:id])

    if @place.update(place_params)
      // TODO Save action here
      flash[:notice] = "Your place was updated successfully."
    else
      // TODO error action here
      flash[:alert] = "There was an error updating this place."
    end
  end

  def destroy
    @place = Place.find(params[:id])

    if @place.destroy(@place)
      // TODO destroy action here
      flash[:notice] = "Your place was destroyed successfully."
    else
      // TODO destroy failure here
      flash[:alert] = "There was an error destroying this place."
    end
  end

  private

  def place_params
    place_params.require(:place).permit(:name, :start_date, :end_date)
  end
end
