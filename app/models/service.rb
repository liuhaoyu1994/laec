class Service < ApplicationRecord
  
  has_many :facility_service
  has_many :facilities, through: :facility_services
  
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, :presence => true,
  :content_type => { content_type:             ["image/jpeg","image/jpg","image/png","image/gif"] },
  :size => { :in => 0..100.megabytes }
  
end
