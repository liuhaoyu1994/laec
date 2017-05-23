class FacilitiesController < ApplicationController
    def show
    @facility = Facility.find(params[:id])
  end


  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to @facility
    else
      render 'new'
    end
    
  end
 
 def index
   @facilities = Facility.all
 end
 
  private

    def facility_params
      params.require(:facility).permit(:title, :description, :contact, :image )
    end
end
