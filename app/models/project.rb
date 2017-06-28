class Project < ApplicationRecord
  belongs_to :user
  has_many :galleries
  has_many :relationships, foreign_key: "article_id",
                                  dependent: :destroy
  has_many :authors, through: :relationships
  has_many :partner_relations
  has_many :research_partners, through: :partner_relations
  has_many :publish_relationships, foreign_key: "project_id",
                                  dependent: :destroy
  has_many :publications ,through: :publish_relationships
  
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
  
  
  def relate(publication)
    publish_relationships.create(publication_id: publication.id)
  end

  def disrelate(publication)
    publish_relationships.find_by(publication_id: publication.id).destroy
  end

  def relate?(publication)
    publications.include?(publication)
  end
  
  
  def partner(research_partner)
    partner_relations.create(research_partner_id: research_partner.id)
  end

  def breakup(research_partner)
    partner_relations.find_by(research_partner_id: research_partner.id).destroy
  end

  def partner?(research_partner)
    publications.include?(publication)
  end
end
