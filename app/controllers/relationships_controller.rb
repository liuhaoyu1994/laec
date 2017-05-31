class RelationshipsController < ApplicationController
  
  def create
    author = User.find(params[:author_id])
    article = Project.find(params[:article_id])
    article.participate(author)
  end

  def destroy
    author = User.find(params[:author_id])
    article = Project.find(params[:article_id])
    article.quit(author)
  end
  
end
