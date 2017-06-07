class PublicationsController < ApplicationController
  def new
    @publication = Publication.new
    @users = User.all
  end

  def show
    @publication = Publication.find(params[:id])
  end

  def index
    @publications = Publication.all
  end


  def create
    @publication = Publication.new(publication_params)
    if @publication.save
      redirect_to edit_publication_path(@publication)
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
      params.require(:publication).permit(:title, :descryption, :file, :users )
    end
    
  
end
