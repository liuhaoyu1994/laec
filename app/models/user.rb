class User < ApplicationRecord
  has_many :projects
  has_many :relationships, foreign_key: "author_id",
                                  dependent: :destroy
  has_many :publish_user_relationships, foreign_key: "user_id",
                                  dependent: :destroy
  has_many :authors, through: :relationships
  has_many :articles, through: :relationships
  has_many :publications, through: :publish_user_relationships
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

  def add(publication)
    publish_user_relationships.create(publication_id: publication.id)
  end

  def quit(publication)
    publish_user_relationships.find_by(publication_id: publication.id).destroy
  end

  def author?(publication)
    publications.include?(publication)
  end

end
