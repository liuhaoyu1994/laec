class PublishUserRelationship < ApplicationRecord
  belongs_to :publication
  belongs_to :user
  

end
