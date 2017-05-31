class Project < ApplicationRecord
  belongs_to :user
  has_many :relationships, foreign_key: "article_id",
                                  dependent: :destroy
  has_many :authors, through: :relationships
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, :presence => true,
  :content_type => { content_type: ["image/jpg","image/jpeg","image/png","image/gif"] },
  :size => { :in => 0..100.megabytes }
  validates :title, presence: true, length: {maximum: 100}



  def participate(user)
    relationships.create(author_id: user.id)
  end

  def quit(user)
    relationships.find_by(author_id: user.id).destroy
  end

  def participate?(user)
    authors.include?(user)
  end
end
