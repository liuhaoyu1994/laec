class StaticPagesController < ApplicationController
  def home
    @projects = Project.order('id DESC').take(3)
    @facilities = Facility.order('id DESC').take(3)
    @users = User.where("department = 1")
  end

  def research
  end

  def service
  end

  def aboutus
    @users = User.all
    @users_senior = User.where("department = 1")
    @users_students = User.where("department = 2")
    @users_members = User.where("department = 3")
    @users_coop = User.where("department = 4")

  end
  

end
