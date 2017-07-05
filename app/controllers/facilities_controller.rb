class FacilitiesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def show
    @facility = Facility.find(params[:id])
    @users = @facility.users.all
  end


  def new
    @facility = Facility.new
    @facilities = Facility.all
    @array = []
    @facilities.each do |d|
      @array.push(d.categotry)
    @cate_array = @array.uniq
    end
  end

  def create
    @facility = Facility.new(facility_params)
    if @facility.save
      redirect_to edit_facility_path(@facility)
    else
      render 'new'
    end
    
  end
 
   def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy
    flash[:success] = "facility deleted"
    redirect_to(facilities_path)
   end
 
  def edit
    @facilities = Facility.all
    @array = []
    @facilities.each do |d|
      @array.push(d.categotry)
    @cate_array = @array.uniq
    end
    @users = User.all
        @facilities = Facility.all

    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    if @facility.update_attributes(facility_params)
      redirect_to @facility
    else
      render 'edit'
    end
  end
 
 
  def index
    @facilities = Facility.all
    @array = []
    @array2 = []
    @facilities.each do |d|
      @array.push(d.categotry)
      @array2.push(d.categotry.gsub(/\s+/, ""))
    @cate_array = @array.uniq
    @no_space_array = @array2.uniq
    end
  end
  
  private

    def facility_params
      params.require(:facility).permit(:title, :description, :contact, :image, :categotry, :make, :model )
    end
end
