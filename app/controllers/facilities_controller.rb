class FacilitiesController < ApplicationController
  def show
    @facility = Facility.find(params[:id])
    @users = @facility.users.all
  end


  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to edit_project_path(@facility)
    else
      render 'new'
    end
    
  end
 
  def edit
    @users = User.all
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    if @facility.update_attributes(facility_params)
    else
      render 'edit'
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
