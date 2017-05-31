class User < ApplicationRecord
  has_many :projects
  has_many :relationships, foreign_key: "author_id",
                                  dependent: :destroy
                                  
  has_many :articles, through: :relationships

  before_save { self.email = email.downcase }

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 250},
                                   format: { with: VALID_EMAIL_REGEX },
                                   uniqueness: { case_sensitive:false}
  has_secure_password
  validates :password, presence: true, length:{minimum:6}


  def participate(project)
    relationships.create(article_id: project.id)
  end

  def quit(project)
    relationships.find_by(article_id: project.id).destroy
  end

  def participate?(project)
    articles.include?(project)
  end

end
