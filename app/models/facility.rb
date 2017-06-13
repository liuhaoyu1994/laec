class Facility < ApplicationRecord
  has_many :facility_contacts
  has_many :appointments
  has_many :facility_service
  has_many :services, through: :facility_services
  has_many :users, through: :facility_contacts
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, :presence => true,
  :content_type => { content_type:             ["image/jpeg","image/jpg","image/png","image/gif"] },
  :size => { :in => 0..100.megabytes }
  
  
  
  
  
  
  def add(user)
    facility_contacts.create(user_id: user.id)
  end

  def delete(user)
    facility_contacts.find_by(user_id: user.id).destroy
  end

  def add?(user)
    users.include?(user)
  end
  
end
