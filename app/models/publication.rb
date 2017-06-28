class Publication < ApplicationRecord
  has_many :publish_user_relationships, foreign_key: "publication_id",
                                  dependent: :destroy
  has_many :users ,through: :publish_user_relationships
  
  has_many :publish_relationships, foreign_key: "publication_id",
                                  dependent: :destroy
  has_many :projects ,through: :publish_relationships
  
  has_attached_file :file
  validates_attachment :file,
  :content_type => { :content_type => 'application/pdf' },
  :size => { :in => 0..100.megabytes }
  
  def add(user)
    publish_user_relationships.create(user_id: user.id)
  end

  def quit(user)
    publish_user_relationships.find_by(user_id: user.id).destroy
  end

  def author?(user)
    users.include?(user)
  end
  
  def relate(project)
    publish_relationships.create(project_id: project.id)
  end

  def disrelate(project)
    publish_relationships.find_by(project_id: project.id).destroy
  end

  def relate?(project)
    projects.include?(project)
  end
end
