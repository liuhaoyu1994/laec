class StaticPagesController < ApplicationController
  def home
    @projects = Project.order('id DESC').take(3)
    @project = Project.take(4)
  end

  def research
  end

  def service
  end

  def aboutus
  end
  

end
