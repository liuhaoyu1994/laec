class PublicationsController < ApplicationController
  
    before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @publication = Publication.new
    @users = User.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def index
    @publications = Publication.all
    
    @array = []
    @publications.each do |d|
      @array.push(d.time)
    end  
    @pub_year = @array.uniq.sort{|x,y| y <=> x }
    @large_element = @pub_year.first
  end


  def create
    @publication = Publication.new(publication_params)
    if @publication.save
      redirect_to new_publication_path
    else
      render 'new'
    end
  end
  
  def edit
    
    @publication = Publication.find(params[:id])
    @users = User.all
  end
  
  private

    def publication_params
      params.require(:publication).permit(:title, :descryption, :file, :users, :time )
    end
    
  
end
