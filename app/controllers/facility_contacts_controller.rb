class FacilityContactsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def create
    @user = User.find(params[:user_id])
    @facility = Facility.find(params[:facility_id])
    @facility.add(@user)
    @users = User.all
    respond_to do |format|
      format.html { redirect_to @facility_show_url }
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @facility = Facility.find(params[:facility_id])
    @facility.delete(@user)
    @users = User.all
    respond_to do |format|
      format.html { redirect_to @facility }
      format.js
    end
  end
end
